# LinkerD Performance Test Setup

## add linkerd helm repo
```bash
helm repo add linkerd https://helm.linkerd.io/stable
```

## install linkerd crds
```bash
helm install linkerd-crds linkerd/linkerd-crds -n linkerd --version 1.8.0 --create-namespace
```

## install linkerd-control-plane chart with default no reservation requests set
```bash
helm upgrade --install linkerd-control-plane -n linkerd \
  --version 1.16.11 \
  --set-file identityTrustAnchorsPEM=ca.crt \
  --set-file identity.issuer.tls.crtPEM=issuer.crt \
  --set-file identity.issuer.tls.keyPEM=issuer.key \
  --set proxy.cores=8 \
  linkerd/linkerd-control-plane
```

## install linkerd-control-plane chart with half istio proxy reservation requests
```bash
helm upgrade --install linkerd-control-plane -n linkerd \
  --version 1.16.11 \
  --set-file identityTrustAnchorsPEM=ca.crt \
  --set-file identity.issuer.tls.crtPEM=issuer.crt \
  --set-file identity.issuer.tls.keyPEM=issuer.key \
  --set proxy.cores=8 \
  --set proxy.resources.cpu.request=50m \
  --set proxy.resources.memory.request=128Mi \
  linkerd/linkerd-control-plane
```

## install linkerd-control-plane chart with default istio proxy reservation requests
```bash
helm upgrade --install linkerd-control-plane -n linkerd \
  --version 1.16.11 \
  --set-file identityTrustAnchorsPEM=ca.crt \
  --set-file identity.issuer.tls.crtPEM=issuer.crt \
  --set-file identity.issuer.tls.keyPEM=issuer.key \
  --set proxy.cores=8 \
  --set proxy.resources.cpu.request=100m \
  --set proxy.resources.memory.request=128Mi \
  linkerd/linkerd-control-plane
``` 

## install linkerd-control-plane chart with double istio proxy reservation requests
```bash
helm upgrade --install linkerd-control-plane -n linkerd \
  --version 1.16.11 \
  --set-file identityTrustAnchorsPEM=ca.crt \
  --set-file identity.issuer.tls.crtPEM=issuer.crt \
  --set-file identity.issuer.tls.keyPEM=issuer.key \
  --set proxy.cores=8 \
  --set proxy.resources.cpu.request=200m \
  --set proxy.resources.memory.request=256Mi \
  linkerd/linkerd-control-plane
```

## check
```bash
linkerd check
```

## install viz extension (optional)
```bash
linkerd viz install | kubectl apply -f -
```

## explore linkerd dashboard (optional)
```bash
linkerd viz dashboard &
```


# Configure an App

## deploy client into linkerd mesh
```bash
kubectl apply -k client/linkerd
```

## deploy httpbin
```bash
kubectl apply -k httpbin/linkerd
```

check to see if httpbin has been deployed with a linkerd proxy
```bash
kubectl get pods -n httpbin
```

## exec into sleep client and curl httpbin /get endpoint to verify mTLS
```bash
kubectl exec -it deploy/sleep -n client -c sleep sh

curl httpbin.httpbin.svc.cluster.local:8000/get
```

Output should look similar to below:
```
{
  "args": {}, 
  "headers": {
    "Accept": "*/*", 
    "Host": "httpbin.httpbin.svc.cluster.local:8000", 
    "L5D-Client-Id": "sleep.client.serviceaccount.identity.linkerd.cluster.local", 
    "User-Agent": "curl/8.6.0"
  }, 
  "origin": "10.42.0.22", 
  "url": "http://httpbin.httpbin.svc.cluster.local:8000/get"
}
```

The `L5D-Client-Id` header is added by the linkerd proxy when it establishes an mTLS connection

## remove httpbin
```bash
kubectl delete -k httpbin/linkerd
```


# Set up the Performance Test

## deploy 50 namespace tiered-app into linkerd mesh
```bash
kubectl apply -k tiered-app/50-namespace-app/linkerd
```

## exec into sleep client and curl tiered-app
```bash
kubectl exec -it deploy/sleep -n client -c sleep sh

curl http://tier-1-app-a.ns-1.svc.cluster.local:8080
```

## deploy 50 vegeta loadgenerators
```bash
kubectl apply -k loadgenerators/50-loadgenerators
```

## watch logs of vegeta loadgenerator
```bash
kubectl logs -l app=vegeta -c vegeta -f -n ns-1
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
output_file="450rps-10m-50-app-linkerd-default-istio-resources-data-run-1.md"
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
helm uninstall linkerd-control-plane -n linkerd
helm uninstall linkerd-crds -n linkerd
```