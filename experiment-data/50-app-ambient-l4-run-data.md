# 50 namespace ambient l7 run

```bash
vegeta attack -dns-ttl=0 -keepalive -http2=false -max-connections=25 -rate ${REQUESTS_PER_SECOND}/1s -duration=${DURATION} | tee results.bin | vegeta report -type=text; done
```

50 loadgenerators
300 RPS
25 connections
10 minutes

% kubectl logs -l app=vegeta -f -n ns-1
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.869ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.27ms, 3.005ms, 2.966ms, 3.307ms, 3.444ms, 3.849ms, 55.613ms
Bytes In      [total, mean]                     491654822, 2731.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000

% kubectl logs -l app=vegeta -n ns-2   
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.248ms
Latencies     [min, mean, 50, 90, 95, 99, max]  1.778ms, 2.993ms, 2.867ms, 3.813ms, 4.235ms, 5.823ms, 56.469ms
Bytes In      [total, mean]                     490755768, 2726.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000

% kubectl logs -l app=vegeta -n ns-3
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.921ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.265ms, 2.858ms, 2.823ms, 3.11ms, 3.228ms, 3.584ms, 61.8ms
Bytes In      [total, mean]                     491652887, 2731.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000  

% kubectl logs -l app=vegeta -n ns-4
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.808ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.194ms, 2.758ms, 2.73ms, 2.994ms, 3.107ms, 3.408ms, 46.314ms
Bytes In      [total, mean]                     491113114, 2728.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000 


% kubectl logs -l app=vegeta -n ns-5
Status Codes  [code:count]                      200:180001  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.73ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.115ms, 2.745ms, 2.712ms, 3.004ms, 3.124ms, 3.48ms, 59.612ms
Bytes In      [total, mean]                     490750017, 2726.39
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000  

% kubectl logs -l app=vegeta -n ns-6
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.675ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.131ms, 2.734ms, 2.696ms, 3.01ms, 3.138ms, 3.535ms, 17.881ms
Bytes In      [total, mean]                     490748343, 2726.38
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000

% kubectl logs -l app=vegeta -n ns-7
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.805ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.198ms, 2.792ms, 2.761ms, 3.031ms, 3.143ms, 3.47ms, 50.865ms
Bytes In      [total, mean]                     490750841, 2726.39
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000

% kubectl logs -l app=vegeta -n ns-8
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 3.059ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.163ms, 2.77ms, 2.735ms, 3.026ms, 3.147ms, 3.512ms, 38.226ms
Bytes In      [total, mean]                     490752009, 2726.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000  

% kubectl logs -l app=vegeta -n ns-9
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.563ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.13ms, 2.675ms, 2.648ms, 2.895ms, 2.994ms, 3.288ms, 50.804ms
Bytes In      [total, mean]                     491289171, 2729.38
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000 

% kubectl logs -l app=vegeta -n ns-10
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180001, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.699ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.242ms, 2.836ms, 2.8ms, 3.097ms, 3.22ms, 3.573ms, 67.36ms
Bytes In      [total, mean]                     493094559, 2739.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180001 

% kubectl logs -l app=vegeta -n ns-11 
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 3.626ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.161ms, 2.907ms, 2.861ms, 3.217ms, 3.366ms, 3.791ms, 72.646ms
Bytes In      [total, mean]                     492374952, 2735.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000

% kubectl logs -l app=vegeta -n ns-12
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.795ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.307ms, 3ms, 2.951ms, 3.328ms, 3.485ms, 3.979ms, 57.778ms
Bytes In      [total, mean]                     493093923, 2739.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000  

% kubectl logs -l app=vegeta -n ns-13
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.624ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.213ms, 2.797ms, 2.77ms, 3.038ms, 3.142ms, 3.417ms, 54.837ms
Bytes In      [total, mean]                     492374015, 2735.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000

% kubectl logs -l app=vegeta -n ns-14
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.711ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.225ms, 2.903ms, 2.862ms, 3.197ms, 3.345ms, 3.75ms, 54.388ms
Bytes In      [total, mean]                     493091391, 2739.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000  

% kubectl logs -l app=vegeta -n ns-15
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180001, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.831ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.203ms, 2.923ms, 2.877ms, 3.251ms, 3.402ms, 3.845ms, 57.044ms
Bytes In      [total, mean]                     492377876, 2735.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180001 


% kubectl logs -l app=vegeta -n ns-16
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.693ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.244ms, 2.856ms, 2.822ms, 3.117ms, 3.24ms, 3.581ms, 54.303ms
Bytes In      [total, mean]                     493094803, 2739.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000

% kubectl logs -l app=vegeta -n ns-17
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.574ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.114ms, 2.91ms, 2.866ms, 3.231ms, 3.386ms, 3.839ms, 47.704ms
Bytes In      [total, mean]                     492374062, 2735.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000  

% kubectl logs -l app=vegeta -n ns-18
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.949ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.253ms, 2.875ms, 2.836ms, 3.157ms, 3.296ms, 3.677ms, 59.28ms
Bytes In      [total, mean]                     493091985, 2739.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000  

% kubectl logs -l app=vegeta -n ns-19
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180001, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.8ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.241ms, 2.904ms, 2.859ms, 3.228ms, 3.377ms, 3.81ms, 42.565ms
Bytes In      [total, mean]                     492377754, 2735.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180001  

% kubectl logs -l app=vegeta -n ns-20
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.614ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.1ms, 2.644ms, 2.618ms, 2.855ms, 2.951ms, 3.222ms, 78.651ms
Bytes In      [total, mean]                     492373717, 2735.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000 

% kubectl logs -l app=vegeta -n ns-21
Status Codes  [code:count]                      200:180001  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.737ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.183ms, 2.825ms, 2.792ms, 3.081ms, 3.199ms, 3.541ms, 54.982ms
Bytes In      [total, mean]                     493090967, 2739.39
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000 

% kubectl logs -l app=vegeta -n ns-22
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.9ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.156ms, 2.824ms, 2.782ms, 3.113ms, 3.256ms, 3.682ms, 35.934ms
Bytes In      [total, mean]                     492374507, 2735.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000 

% kubectl logs -l app=vegeta -n ns-23
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.657ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.234ms, 2.849ms, 2.811ms, 3.114ms, 3.241ms, 3.629ms, 49.605ms
Bytes In      [total, mean]                     493092816, 2739.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000 

% kubectl logs -l app=vegeta -n ns-24
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180001, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.711ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.156ms, 2.849ms, 2.806ms, 3.153ms, 3.298ms, 3.717ms, 39.533ms
Bytes In      [total, mean]                     492378248, 2735.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180001  

% kubectl logs -l app=vegeta -n ns-25
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.445ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.189ms, 2.806ms, 2.774ms, 3.055ms, 3.171ms, 3.516ms, 37.653ms
Bytes In      [total, mean]                     493094144, 2739.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000

% kubectl logs -l app=vegeta -n ns-26
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.909ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.188ms, 2.902ms, 2.856ms, 3.232ms, 3.386ms, 3.833ms, 34.092ms
Bytes In      [total, mean]                     492375642, 2735.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000  

% kubectl logs -l app=vegeta -n ns-27
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.856ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.263ms, 2.885ms, 2.851ms, 3.147ms, 3.275ms, 3.643ms, 46.273ms
Bytes In      [total, mean]                     493092923, 2739.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000 

% kubectl logs -l app=vegeta -n ns-29
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180001, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 3.764ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.413ms, 3.357ms, 3.286ms, 3.787ms, 4.005ms, 4.835ms, 64.269ms
Bytes In      [total, mean]                     492560944, 2736.43
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180001

% kubectl logs -l app=vegeta -n ns-30
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.06ms
Latencies     [min, mean, 50, 90, 95, 99, max]  1.789ms, 3.042ms, 2.92ms, 3.862ms, 4.271ms, 5.832ms, 38.867ms
Bytes In      [total, mean]                     492197230, 2734.43
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000  

% kubectl logs -l app=vegeta -n ns-31
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.645ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.356ms, 3.32ms, 3.233ms, 3.815ms, 4.079ms, 5.104ms, 44.845ms
Bytes In      [total, mean]                     492735286, 2737.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000 

% kubectl logs -l app=vegeta -n ns-32
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.92ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.325ms, 2.941ms, 2.911ms, 3.187ms, 3.308ms, 3.646ms, 17.296ms
Bytes In      [total, mean]                     492189921, 2734.39
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000  

% kubectl logs -l app=vegeta -n ns-33
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.79ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.185ms, 2.775ms, 2.742ms, 3.021ms, 3.141ms, 3.482ms, 48.068ms
Bytes In      [total, mean]                     492914339, 2738.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000

% kubectl logs -l app=vegeta -n ns-34
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180001, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.91ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.265ms, 2.827ms, 2.803ms, 3.049ms, 3.148ms, 3.431ms, 35.57ms
Bytes In      [total, mean]                     492376669, 2735.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180001  

% kubectl logs -l app=vegeta -n ns-35
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.772ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.213ms, 2.824ms, 2.794ms, 3.064ms, 3.172ms, 3.483ms, 54.098ms
Bytes In      [total, mean]                     493090595, 2739.39
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000  

% kubectl logs -l app=vegeta -n ns-36
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180001, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.543ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.239ms, 2.775ms, 2.748ms, 2.996ms, 3.103ms, 3.391ms, 52.332ms
Bytes In      [total, mean]                     492912926, 2738.39
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180001 

% kubectl logs -l app=vegeta -n ns-37
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.622ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.096ms, 2.65ms, 2.616ms, 2.9ms, 3.017ms, 3.369ms, 33.362ms
Bytes In      [total, mean]                     493092014, 2739.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000  

% kubectl logs -l app=vegeta -n ns-38
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.537ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.074ms, 2.654ms, 2.621ms, 2.892ms, 3.006ms, 3.347ms, 59.481ms
Bytes In      [total, mean]                     493092275, 2739.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000 

% kubectl logs -l app=vegeta -n ns-39
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.576ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.226ms, 2.791ms, 2.761ms, 3.024ms, 3.129ms, 3.439ms, 52.846ms
Bytes In      [total, mean]                     493092454, 2739.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000  

% kubectl logs -l app=vegeta -n ns-40
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.73ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.085ms, 2.631ms, 2.599ms, 2.875ms, 2.987ms, 3.337ms, 55.915ms
Bytes In      [total, mean]                     493092022, 2739.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000  

% kubectl logs -l app=vegeta -n ns-41
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.953ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.295ms, 2.878ms, 2.845ms, 3.133ms, 3.248ms, 3.606ms, 34.349ms
Bytes In      [total, mean]                     493092099, 2739.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000

% kubectl logs -l app=vegeta -n ns-42 
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.664ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.307ms, 2.913ms, 2.88ms, 3.154ms, 3.272ms, 3.636ms, 53.206ms
Bytes In      [total, mean]                     492188532, 2734.38
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000  

% kubectl logs -l app=vegeta -n ns-43
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 3.06ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.345ms, 2.998ms, 2.955ms, 3.292ms, 3.425ms, 3.832ms, 65.877ms
Bytes In      [total, mean]                     492551874, 2736.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000 

% kubectl logs -l app=vegeta -n ns-44
Status Codes  [code:count]                      200:180001  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.406ms
Latencies     [min, mean, 50, 90, 95, 99, max]  1.968ms, 2.501ms, 2.478ms, 2.71ms, 2.807ms, 3.069ms, 32.535ms
Bytes In      [total, mean]                     492552778, 2736.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000  

% kubectl logs -l app=vegeta -n ns-45
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.62ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.288ms, 2.98ms, 2.933ms, 3.3ms, 3.45ms, 3.892ms, 23.829ms
Bytes In      [total, mean]                     493093026, 2739.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000 

% kubectl logs -l app=vegeta -n ns-46
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 3.073ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.226ms, 2.86ms, 2.825ms, 3.132ms, 3.263ms, 3.607ms, 17.565ms
Bytes In      [total, mean]                     492913094, 2738.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000  

% kubectl logs -l app=vegeta -n ns-47
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.695ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.092ms, 2.674ms, 2.646ms, 2.887ms, 2.99ms, 3.273ms, 54.548ms
Bytes In      [total, mean]                     492914181, 2738.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000 

% kubectl logs -l app=vegeta -n ns-48
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.741ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.17ms, 2.792ms, 2.753ms, 3.069ms, 3.203ms, 3.601ms, 55.961ms
Bytes In      [total, mean]                     492912103, 2738.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000 

% kubectl logs -l app=vegeta -n ns-49
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.814ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.256ms, 2.916ms, 2.872ms, 3.204ms, 3.351ms, 3.748ms, 55.518ms
Bytes In      [total, mean]                     492911519, 2738.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000  

% kubectl logs -l app=vegeta -n ns-50
Status Codes  [code:count]                      200:180000  
Error Set:
Requests      [total, rate, throughput]         180000, 300.00, 300.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.621ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.21ms, 2.855ms, 2.83ms, 3.082ms, 3.185ms, 3.472ms, 54.359ms
Bytes In      [total, mean]                     492373033, 2735.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:180000 


