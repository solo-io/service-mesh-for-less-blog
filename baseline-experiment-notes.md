# Baseline Performance Test Setup

# Configure an App

## deploy client
```bash
kubectl apply -k client/base
```

## deploy httpbin
```bash
kubectl apply -k httpbin/base
```

## exec into sleep client and curl httpbin /get endpoint
```bash
kubectl exec -it deploy/sleep -n client -c sleep sh

curl httpbin.httpbin.svc.cluster.local:8000/get
```

## remove httpbin
```bash
kubectl delete -k httpbin/base
```


# Set up the Performance Test

## deploy 50 namespace tiered-app
```bash
kubectl apply -k tiered-app/50-namespace-app/base
```

## exec into sleep client and curl tiered-app
```bash
kubectl exec -it deploy/sleep -n client sh

curl http://tier-1-app-a.ns-1.svc.cluster.local:8080
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
output_file="450rps-10m-50-app-baseline-data-run-1.md"
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

## uninstall
```bash
kubectl delete -k loadgenerators/50-loadgenerators
kubectl delete -k tiered-app/50-namespace-app/base
kubectl delete -k client/base
```

## 50 namespace app notes (8cpu nodes)
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
  - CPU requests: 500m // CPU limits: 500m (guaranteed QoS)
  - MEM requests: 300Mi // MEM limits: 300Mi (guaranteed QoS)

Total load generator baseline requirements are 25 CPU cores and 15 GB memory

#### Total expected baseline (not including default GKE addons)
Total expected baseline requirements: 165 CPU Cores and 115GB memory