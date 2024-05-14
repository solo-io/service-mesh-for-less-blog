# Ambient Performance Test Setup

## add ambient helm repo
```bash
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update
```

## install istio-base
```bash
helm upgrade --install istio-base istio/base -n istio-system --version 1.22.0 --create-namespace
```

## install Kubernetes Gateway CRDs
```bash
echo "installing Kubernetes Gateway CRDs"
kubectl get crd gateways.gateway.networking.k8s.io &> /dev/null || \
  { kubectl kustomize "github.com/kubernetes-sigs/gateway-api/config/crd?ref=v1.0.0" | kubectl apply -f -; }
```


## install istio-cni
```bash
helm upgrade --install istio-cni istio/cni \
-n kube-system \
--version=1.22.0 \
-f -<<EOF
profile: ambient
# uncomment below if using GKE
cni:
  cniBinDir: /home/kubernetes/bin
EOF
```

## install istiod
```bash
helm upgrade --install istiod istio/istiod \
-n istio-system \
--version=1.22.0 \
-f -<<EOF
profile: ambient
EOF
```

## install ztunnel

For GKE, ztunnel is expected to be deployed in `kube-system`
```bash
helm upgrade --install ztunnel istio/ztunnel \
-n kube-system \
--version=1.22.0 \
-f -<<EOF
hub: docker.io/istio
tag: 1.22.0
resources:
  requests:
      cpu: 500m
      memory: 2048Mi
istioNamespace: istio-system
logLevel: error
EOF
```

## install ingressgateway (optional)
```
helm upgrade --install istio-ingress istio/gateway \
-n istio-system \
--version=1.22.0 \
-f -<<EOF
replicaCount: 1
 
service:
  ## Type of service. Set to "None" to disable the service entirely
  type: LoadBalancer
  ports:
  - name: http2
    port: 80
    protocol: TCP
    targetPort: 80
  - name: https
    port: 443
    protocol: TCP
    targetPort: 443
 
## Labels to apply to all resources
labels:
  istio: ingressgateway
EOF
```


# Configure an App and validate mTLS working

## deploy client into ambient mesh
```bash
kubectl apply -k client/ambient
```

## deploy httpbin into ambient mesh
```bash
kubectl apply -k httpbin/ambient
```

## exec into sleep client and curl httpbin
```bash
kubectl exec -it deploy/sleep -n client -c sleep sh

curl httpbin.httpbin.svc.cluster.local:8000/get
```

## watch logs of ztunnel for traffic interception
```bash
kubectl logs -n kube-system ds/ztunnel -f
```

## remove httpbin
```bash
kubectl delete -k httpbin/ambient
```


# Set up the Performance Test

## deploy 50 namespace tiered-app into ambient mesh
```bash
kubectl apply -k tiered-app/50-namespace-app/ambient
```

## exec into sleep client and curl tiered-app
```bash
kubectl exec -it deploy/sleep -n client sh

curl http://tier-1-app-a.ns-1.svc.cluster.local:8080
```

## watch logs of ztunnel for traffic interception
```bash
kubectl logs -n kube-system ds/ztunnel -f
```

Output should look similar to below, note you can see the spiffe ID of client sleep
```
2024-03-07T00:45:13.205154Z  INFO inbound{id=75f92cf47e739b015f76405a976d0359 peer_ip=10.32.1.7 peer_id=spiffe://cluster.local/ns/client/sa/sleep}: ztunnel::proxy::inbound: got CONNECT request to 10.32.3.6:80
2024-03-07T00:45:13.839633Z  INFO inbound{id=e737b49726c8c0a5b92e20c0ae6b7872 peer_ip=10.32.1.7 peer_id=spiffe://cluster.local/ns/client/sa/sleep}: ztunnel::proxy::inbound: got CONNECT request to 10.32.3.6:80
2024-03-07T00:45:14.377121Z  INFO inbound{id=1c8da768ba34c2eba072911c6a17b892 peer_ip=10.32.1.7 peer_id=spiffe://cluster.local/ns/client/sa/sleep}: ztunnel::proxy::inbound: got CONNECT request to 10.32.3.6:80
```

## deploy 50 vegeta loadgenerators
```bash
kubectl apply -k loadgenerators/50-loadgenerators
```

## watch logs of vegeta loadgenerator
```bash
kubectl logs -l app=vegeta -f -n ns-1
```

## watch top pods
```bash
watch kubectl top pods -n ns-1
watch kubectl top pods -n kube-system --sort-by cpu
```

## collect logs
In the `experiment-data/tail-logs.sh` script change the following variables
```
# Define the range of namespaces
start_namespace=1
end_namespace=50

# Define the output file
output_file="450rps-10m-30-app-istio-ambient-l4-run-data-run-1.md"
```

Run the script to collect logs:
```
cd experiment-data
./tail-logs.sh
```

## example exec into vegeta to run your own test (optional)
```bash
kubectl --namespace ns-1 exec -it deploy/vegeta -c vegeta -- /bin/sh
```

test run:
```bash
echo "GET http://tier-1-app-a.ns-1.svc.cluster.local:8080" | vegeta attack -dns-ttl=0 -rate 500/1s -duration=2s | tee results.bin | vegeta report -type=text
```

## deploy sample addons (optional)
```bash
kubectl apply -k addons
```

## port forward to grafana (optional)
```bash
kubectl port-forward svc/grafana -n istio-system 3000:3000
```

## port forward to kiali (optional)
```bash
kubectl port-forward svc/kiali -n istio-system 20001:20001
```

## uninstall
```bash
helm uninstall ztunnel -n kube-system
helm uninstall istiod -n istio-system
helm uninstall istio-cni -n kube-system
helm uninstall istio-base -n istio-system
kubectl kustomize "github.com/kubernetes-sigs/gateway-api/config/crd?ref=v1.0.0" | kubectl delete -f -;
```