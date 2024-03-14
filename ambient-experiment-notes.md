# add ambient helm repo
```bash
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update
```

# install istio-base
```bash
helm upgrade --install istio-base istio/base -n istio-system --version 1.20.3 --create-namespace
```

# install Kubernetes Gateway CRDs
```bash
echo "installing Kubernetes Gateway CRDs"
kubectl get crd gateways.gateway.networking.k8s.io &> /dev/null || \
  { kubectl kustomize "github.com/kubernetes-sigs/gateway-api/config/crd?ref=v1.0.0" | kubectl apply -f -; }
```


# install istio-cni
```bash
helm upgrade --install istio-cni istio/cni \
-n kube-system \
--version=1.20.3 \
-f -<<EOF
cni:
  enabled: true
  namespace: kube-system
  # Configuration log level of istio-cni binary
  # by default istio-cni send all logs to UDS server
  # if want to see them you need change global.logging.level with cni:debug
  logLevel: info  
  # Allow the istio-cni container to run in privileged mode, needed for some platforms (e.g. OpenShift)
  privileged: true  
  # Deploy the config files as plugin chain (value "true") or as standalone files in the conf dir (value "false")?
  # Some k8s flavors (e.g. OpenShift) do not support the chain approach, set to false if this is the case
  chained: true
  # Configure ambient settings
  ambient:
    # If enabled, ambient redirection will be enabled
    enabled: true  
  # Default excludes istio-system; its actually fine to redirect there since we opt-out istiod, ztunnel, and istio-cni
  excludeNamespaces:
  - kube-system
  - istio-system
  
  ## GKE SPECIFIC
  cniBinDir: /home/kubernetes/bin
EOF
```

# install istiod
```bash
helm upgrade --install istiod istio/istiod \
-n istio-system \
--version=1.20.3 \
-f -<<EOF
## Discovery Settings
pilot:
  env:
    # Setup more secure default that is off in 'default' only for backwards compatibility
    VERIFY_CERTIFICATE_AT_CLIENT: "true"
    ENABLE_AUTO_SNI: "true"

    PILOT_ENABLE_HBONE: "true"
    CA_TRUSTED_NODE_ACCOUNTS: "istio-system/ztunnel,kube-system/ztunnel"
    PILOT_ENABLE_AMBIENT_CONTROLLERS: "true"

# ProxyConfig settings
meshConfig:
  defaultConfig:
    proxyMetadata:
      ISTIO_META_ENABLE_HBONE: "true"

# Telemetry handled with Telemetry API only
telemetry:
  enabled: false
  v2:
    enabled: false

# keep in sync with settings used when installing the Istio CNI chart
istio_cni:
  enabled: true
  chained: true
EOF
```

# install ztunnel
```bash
helm upgrade --install ztunnel istio/ztunnel \
-n istio-system \
--version=1.20.3 \
-f -<<EOF
hub: docker.io/istio
tag: 1.20.3
resources:
  requests:
      cpu: 500m
      memory: 2048Mi
istioNamespace: istio-system
EOF
```

# deploy client into ambient mesh
```bash
kubectl apply -k client/ambient
```

# deploy httpbin into ambient mesh
```bash
kubectl apply -k httpbin/ambient
```

# deploy 50 namespace tiered-app baseline (no mesh)
```bash
kubectl apply -k tiered-app/50-namespace-app/base
```

# deploy 50 namespace tiered-app into ambient mesh
```bash
kubectl apply -k tiered-app/50-namespace-app/ambient
```

# exec into sleep client and curl httpbin or tiered-app
```bash
kubectl exec -it deploy/sleep -n client sh

curl httpbin.httpbin.svc.cluster.local:8000/get
curl http://tier-1-app-a.ns-1.svc.cluster.local:8080
```

# watch logs of ztunnel for traffic interception
```bash
kubectl logs -n istio-system ds/ztunnel -f
```

Output should look similar to below, note you can see the spiffe ID of client sleep
```
2024-03-07T00:45:13.205154Z  INFO inbound{id=75f92cf47e739b015f76405a976d0359 peer_ip=10.32.1.7 peer_id=spiffe://cluster.local/ns/client/sa/sleep}: ztunnel::proxy::inbound: got CONNECT request to 10.32.3.6:80
2024-03-07T00:45:13.839633Z  INFO inbound{id=e737b49726c8c0a5b92e20c0ae6b7872 peer_ip=10.32.1.7 peer_id=spiffe://cluster.local/ns/client/sa/sleep}: ztunnel::proxy::inbound: got CONNECT request to 10.32.3.6:80
2024-03-07T00:45:14.377121Z  INFO inbound{id=1c8da768ba34c2eba072911c6a17b892 peer_ip=10.32.1.7 peer_id=spiffe://cluster.local/ns/client/sa/sleep}: ztunnel::proxy::inbound: got CONNECT request to 10.32.3.6:80
```

# deploy 50 vegeta loadgenerators
```bash
kubectl apply -k 50-loadgenerators
```

# watch logs of vegeta loadgenerator
```bash
kubectl logs -l app=vegeta -f -n ns-1
```

# exec into vegeta
```bash
kubectl --namespace ns-1 exec -it deploy/vegeta -c vegeta -- /bin/sh
```

test run:
```bash
echo "GET http://tier-1-app-a.ns-1.svc.cluster.local:8080" | vegeta attack -dns-ttl=0 -rate 500/1s -duration=2s | tee results.bin | vegeta report -type=text
```

# deploy sample addons
```bash
kubectl apply -k addons
```

# port forward to grafana
```bash
kubectl port-forward svc/grafana -n istio-system 3000:3000
```

# port forward to kiali
```bash
kubectl port-forward svc/kiali -n istio-system 20001:20001
```

# uninstall
```bash
helm uninstall ztunnel -n istio-system
helm uninstall istiod -n istio-system
helm uninstall istio-cni -n kube-system
helm uninstall istio-base -n istio-system
kubectl kustomize "github.com/kubernetes-sigs/gateway-api/config/crd?ref=v1.0.0" | kubectl delete -f -;
```

# 50 namespace app notes (8cpu nodes)
- 50 namespace isolated applications
- 3-tier application, 4 deployments per namespace, 1 replicas per deployment 
  - A > B1,B2 > C
  - CPU requests: 700m // CPU limits: 700m (guaranteed QoS)
  - MEM requests: 500Mi // MEM limits: 500Mi (guaranteed QoS)
- Application Latency expectations:
  - average latency < 40ms
  - max latency < 200ms
- Expected CPU utilization tuned to around 30-40% (visualized in GKE Observability)

Total application baseline requirements are 140 CPU cores and 100 GB memory

- Load generator per namespace targeting tier 1 application level
  - deployed to separate loadgen node pool
  - using n2-standard-8 spot instances in autoscaling mode 1-6 nodes
  - Tune RPS with 25 connections
  - CPU requests: 500m // CPU limits: 500m (guaranteed QoS)
  - MEM requests: 300Mi // MEM limits: 300Mi (guaranteed QoS)

Total load generator baseline requirements are 25 CPU cores and 15 GB memory

- Istio Component Requests:
  - 24 ztunnels - `500m` CPU and `2048Mi` memory
  - 24 istio-cni - `100m` and `100Mi` memory
  - istiod - `500m` and `2Gi` memory

  (optional value add)
  - 100 waypoint proxies (2 per namespace) - `100m` and `128Mi` memory
  
Total Istio Components requirements are CPU: 15 CPU Cores  and 41GB memory

## Total expected baseline (not including default GKE addons)
Total expected baseline requirements: 180 CPU Cores and 184GB memory

# Experiment outcome
- 21 application nodes (n2-standard-8)
- 4 loadgenerator nodes (n2-standard-8)
- Total CPU: 200 vCPU
- stable 300 RPS across 50 load generators x 4 services per namespace totaling a mesh wide 60K RPS
- Average latency in the 2-5ms, max latency of <20ms which is significantly lower than our target of <100ms

- Number of Deployments using `k get deploy -A | wc -l`: 261
- Number of Pods using `k get pods -A | grep Running | wc -l`: 419
- Number of Services using `k get svc -A | wc -l`: 209
- Number of Containers `kubectl get pod --all-namespaces | awk '{print $3}' | awk -F/ '{s+=$1} END {print s}'`: 503


GKE Observability L4 test - 8cpu instances (30 min)
![50-app-ambient-gke-observability](.images/50-app-ambient-gke-l4-observability.png)





# 50 namespace app notes (16cpu nodes)
- 50 namespace isolated applications
- 3-tier application, 4 deployments per namespace, 1 replicas per deployment 
  - A > B1,B2 > C
  - CPU requests: 700m // CPU limits: 700m (guaranteed QoS)
  - MEM requests: 500Mi // MEM limits: 500Mi (guaranteed QoS)
- Application Latency expectations:
  - average latency < 40ms
  - max latency < 200ms
- Expected CPU utilization tuned to around 30-40% (visualized in GKE Observability)

Total application baseline requirements are 140 CPU cores and 100 GB memory

- Load generator per namespace targeting tier 1 application level
  - deployed to separate loadgen node pool
  - using n2-standard-8 spot instances in autoscaling mode 1-6 nodes
  - Tune RPS with 25 connections
  - CPU requests: 500m // CPU limits: 500m (guaranteed QoS)
  - MEM requests: 300Mi // MEM limits: 300Mi (guaranteed QoS)

Total load generator baseline requirements are 25 CPU cores and 15 GB memory

- Istio Component Requests:
  - 13 ztunnels - `500m` CPU and `2048Mi` memory
  - 13 istio-cni - `100m` and `100Mi` memory
  - istiod - `500m` and `2Gi` memory

  (optional value add)
  - 100 waypoint proxies (2 per namespace) - `100m` and `128Mi` memory
  
Total Istio Components requirements are CPU: 9 CPU Cores  and 33GB memory

## Total expected baseline (not including default GKE addons)
Total expected baseline requirements: 180 CPU Cores and 184GB memory

# Experiment outcome
- 12 application nodes (n2-standard-8)
- 1 loadgenerator nodes (n2-standard-8)
- Total CPU: 208 vCPU
- stable 300 RPS across 50 load generators x 4 services per namespace totaling a mesh wide 60K RPS
- Average latency in the 2-5ms, max latency of <20ms which is significantly lower than our target of <100ms

- Number of Deployments using `k get deploy -A | wc -l`: 261
- Number of Pods using `k get pods -A | grep Running | wc -l`: 347
- Number of Services using `k get svc -A | wc -l`: 209
- Number of Containers `kubectl get pod --all-namespaces | awk '{print $3}' | awk -F/ '{s+=$1} END {print s}'`: 395


GKE Observability L4 test - 8cpu instances (30 min)
![50-app-ambient-gke-observability](.images/50-app-ambient-gke-l4-observability.png)


# ztunnel without waypoint - 250RPS
% k top pods -n istio-system | grep ztunnel
ztunnel-29wfc             785m         56Mi            
ztunnel-5lj6c             780m         51Mi            
ztunnel-79qj7             763m         60Mi            
ztunnel-92r4l             807m         50Mi            
ztunnel-c8zwt             801m         56Mi            
ztunnel-pprgj             814m         75Mi            
ztunnel-pr8jp             697m         51Mi            
ztunnel-pz4ms             824m         61Mi            
ztunnel-r4jgz             832m         65Mi            
ztunnel-sf8v5             770m         55Mi            
ztunnel-wb9px             51m          58Mi            
ztunnel-wjxg7             1m           39Mi            
ztunnel-x2crr             789m         58Mi

# ztunnel with waypoint - 250RPS
% k top pods -n istio-system | grep ztunnel
ztunnel-29wfc             690m         57Mi            
ztunnel-5lj6c             746m         53Mi            
ztunnel-79qj7             704m         60Mi            
ztunnel-92r4l             840m         53Mi            
ztunnel-c8zwt             848m         56Mi            
ztunnel-pprgj             906m         76Mi            
ztunnel-pr8jp             571m         52Mi            
ztunnel-pz4ms             933m         63Mi            
ztunnel-r4jgz             771m         64Mi            
ztunnel-sf8v5             763m         57Mi            
ztunnel-wb9px             925m         61Mi            
ztunnel-wjxg7             1m           39Mi            
ztunnel-x2crr             579m         57Mi 

