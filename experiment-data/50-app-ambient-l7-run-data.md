# 50 namespace ambient l7 run

```bash
vegeta attack -dns-ttl=0 -keepalive -http2=false -max-connections=25 -rate ${REQUESTS_PER_SECOND}/1s -duration=${DURATION} | tee results.bin | vegeta report -type=text; done
```

50 loadgenerators
250 RPS
25 connections
10 minutes

% kubectl logs -l app=vegeta -f -n ns-1 
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 7.489ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.832ms, 7.697ms, 7.444ms, 8.963ms, 9.62ms, 11.273ms, 52.61ms
Bytes In      [total, mean]                     490713070, 3271.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000 

% kubectl logs -l app=vegeta -f -n ns-2
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 10.424ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.859ms, 8.412ms, 8.145ms, 9.92ms, 10.618ms, 12.752ms, 77.081ms
Bytes In      [total, mean]                     491339593, 3275.60
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000 

% kubectl logs -l app=vegeta -n ns-3   
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 9.916ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.362ms, 8.267ms, 7.988ms, 9.868ms, 10.717ms, 13.639ms, 43.979ms
Bytes In      [total, mean]                     491322080, 3275.48
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000

% kubectl logs -l app=vegeta -n ns-4
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 8.776ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.92ms, 8.685ms, 8.499ms, 10.103ms, 10.663ms, 12.322ms, 57.88ms
Bytes In      [total, mean]                     491548235, 3276.99
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000

% kubectl logs -l app=vegeta -n ns-5
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 8.019ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.248ms, 7.349ms, 7.207ms, 8.324ms, 8.817ms, 10.146ms, 63.472ms
Bytes In      [total, mean]                     491470898, 3276.47
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000

% kubectl logs -l app=vegeta -n ns-6
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 7.087ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.539ms, 7.207ms, 7.075ms, 8.018ms, 8.453ms, 9.729ms, 45.614ms
Bytes In      [total, mean]                     491467846, 3276.45
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000

% kubectl logs -l app=vegeta -n ns-7
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 10.652ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.835ms, 7.59ms, 7.333ms, 8.718ms, 9.396ms, 11.217ms, 75.654ms
Bytes In      [total, mean]                     491474405, 3276.50
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000  

% kubectl logs -l app=vegeta -n ns-8
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 5.621ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.381ms, 5.612ms, 5.559ms, 6.096ms, 6.329ms, 7.24ms, 43.798ms
Bytes In      [total, mean]                     491467254, 3276.45
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000

% kubectl logs -l app=vegeta -n ns-9
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 10.103ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.809ms, 8.819ms, 8.666ms, 10.16ms, 10.758ms, 12.88ms, 59.461ms
Bytes In      [total, mean]                     491533831, 3276.89
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000 

% kubectl logs -l app=vegeta -n ns-10
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 6.22ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.091ms, 6.684ms, 6.504ms, 7.523ms, 8.067ms, 9.692ms, 60.005ms
Bytes In      [total, mean]                     492365060, 3282.43
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000

% kubectl logs -l app=vegeta -n ns-11
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 7.423ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.956ms, 6.681ms, 6.518ms, 7.59ms, 8.113ms, 9.561ms, 62.008ms
Bytes In      [total, mean]                     492062296, 3280.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000  

% kubectl logs -l app=vegeta -n ns-12
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 8.085ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.626ms, 7.555ms, 7.386ms, 8.548ms, 9.06ms, 10.562ms, 35.676ms
Bytes In      [total, mean]                     492376922, 3282.51
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000  

% kubectl logs -l app=vegeta -n ns-13
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 6.029ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.226ms, 6.556ms, 6.435ms, 7.24ms, 7.656ms, 8.942ms, 38.675ms
Bytes In      [total, mean]                     492059940, 3280.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000

% kubectl logs -l app=vegeta -n ns-14
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 7.086ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.542ms, 8.212ms, 7.968ms, 9.562ms, 10.346ms, 13.009ms, 74.943ms
Bytes In      [total, mean]                     492375777, 3282.51
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000  

% kubectl logs -l app=vegeta -n ns-15
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 5.756ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.797ms, 6.587ms, 6.447ms, 7.494ms, 7.978ms, 9.272ms, 49.322ms
Bytes In      [total, mean]                     492067104, 3280.45
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000  

% kubectl logs -l app=vegeta -n ns-16
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 7.455ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.597ms, 7.314ms, 7.099ms, 8.403ms, 8.994ms, 10.441ms, 54.657ms
Bytes In      [total, mean]                     492218233, 3281.45
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000  


alexly-solo@Solo-System-ALy linkerd-ambient-blog % kubectl logs -l app=vegeta -n ns-17
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 7.199ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.858ms, 7.699ms, 7.54ms, 8.706ms, 9.204ms, 10.605ms, 54.726ms
Bytes In      [total, mean]                     492377923, 3282.52
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000 

% kubectl logs -l app=vegeta -n ns-18
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 6.194ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.082ms, 6.357ms, 6.255ms, 6.986ms, 7.315ms, 8.374ms, 61.625ms
Bytes In      [total, mean]                     491916847, 3279.45
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000

% kubectl logs -l app=vegeta -n ns-19
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 7.007ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.954ms, 8.577ms, 8.326ms, 10.111ms, 10.882ms, 13.101ms, 47.505ms
Bytes In      [total, mean]                     492533275, 3283.56
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000

% kubectl logs -l app=vegeta -n ns-20
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 7.633ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.987ms, 7.658ms, 7.516ms, 8.533ms, 9.001ms, 10.388ms, 48.221ms
Bytes In      [total, mean]                     492375060, 3282.50
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000  

% kubectl logs -l app=vegeta -n ns-21
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 5.744ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.67ms, 6.124ms, 5.993ms, 6.9ms, 7.315ms, 8.56ms, 89.428ms
Bytes In      [total, mean]                     492061662, 3280.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000 

% kubectl logs -l app=vegeta -n ns-22
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 10.767ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.863ms, 7.753ms, 7.516ms, 8.875ms, 9.533ms, 11.416ms, 58.487ms
Bytes In      [total, mean]                     492224086, 3281.49
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000  

% kubectl logs -l app=vegeta -n ns-23
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 8.24ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.697ms, 8.463ms, 8.204ms, 10.021ms, 10.775ms, 13.353ms, 62.118ms
Bytes In      [total, mean]                     492225261, 3281.50
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000  

% kubectl logs -l app=vegeta -n ns-24
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 8.332ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.792ms, 7.865ms, 7.647ms, 9.087ms, 9.726ms, 11.495ms, 49.709ms
Bytes In      [total, mean]                     491922675, 3279.48
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000  

% kubectl logs -l app=vegeta -n ns-25
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 6.006ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.969ms, 6.471ms, 6.35ms, 7.253ms, 7.662ms, 8.877ms, 50.484ms
Bytes In      [total, mean]                     492523201, 3283.49
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000 

% kubectl logs -l app=vegeta -n ns-26
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 5.879ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.471ms, 5.575ms, 5.468ms, 6.153ms, 6.502ms, 7.648ms, 39.534ms
Bytes In      [total, mean]                     491915914, 3279.44
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000

% kubectl logs -l app=vegeta -n ns-27
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 7.69ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.606ms, 8.374ms, 8.115ms, 9.785ms, 10.601ms, 13.198ms, 76.439ms
Bytes In      [total, mean]                     492376663, 3282.51
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000 

% kubectl logs -l app=vegeta -n ns-28 
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 7.415ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.208ms, 7.019ms, 6.845ms, 8.028ms, 8.599ms, 10.415ms, 67.443ms
Bytes In      [total, mean]                     492060464, 3280.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000  

% kubectl logs -l app=vegeta -n ns-29
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 5.759ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.872ms, 6.267ms, 6.118ms, 7.032ms, 7.47ms, 8.734ms, 58.446ms
Bytes In      [total, mean]                     492519641, 3283.46
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000  

% kubectl logs -l app=vegeta -n ns-30
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 6.509ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.481ms, 7.738ms, 7.469ms, 9.116ms, 9.854ms, 11.947ms, 76.81ms
Bytes In      [total, mean]                     492572710, 3283.82
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000 

% kubectl logs -l app=vegeta -n ns-31
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 7.448ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.205ms, 6.628ms, 6.521ms, 7.305ms, 7.666ms, 8.916ms, 38.838ms
Bytes In      [total, mean]                     492214765, 3281.43
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000  

% kubectl logs -l app=vegeta -n ns-32
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 7.945ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.575ms, 7.999ms, 7.707ms, 9.506ms, 10.295ms, 12.311ms, 58.934ms
Bytes In      [total, mean]                     492667506, 3284.45
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000 

% kubectl logs -l app=vegeta -n ns-33
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 7.163ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.176ms, 7.403ms, 7.175ms, 8.656ms, 9.341ms, 11.206ms, 65.709ms
Bytes In      [total, mean]                     492722187, 3284.81
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000 

% kubectl logs -l app=vegeta -n ns-34
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 7.549ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.993ms, 8.077ms, 7.811ms, 9.357ms, 10.055ms, 11.991ms, 133.963ms
Bytes In      [total, mean]                     492519652, 3283.46
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000 

% kubectl logs -l app=vegeta -n ns-35
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 10.398ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.962ms, 9.329ms, 9.087ms, 11.031ms, 11.864ms, 14.502ms, 56.027ms
Bytes In      [total, mean]                     492687268, 3284.58
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000  

% kubectl logs -l app=vegeta -n ns-36
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 7.719ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.604ms, 7.432ms, 7.271ms, 8.389ms, 8.925ms, 10.246ms, 72.019ms
Bytes In      [total, mean]                     492518169, 3283.45
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000  

% kubectl logs -l app=vegeta -n ns-37
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 9.409ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.77ms, 8.11ms, 7.873ms, 9.452ms, 10.122ms, 12.056ms, 64.903ms
Bytes In      [total, mean]                     492520406, 3283.47
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000 

% kubectl logs -l app=vegeta -n ns-38
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 7.649ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.183ms, 7.467ms, 7.211ms, 8.886ms, 9.569ms, 11.592ms, 76.911ms
Bytes In      [total, mean]                     492667206, 3284.45
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000 


alexly-solo@Solo-System-ALy linkerd-ambient-blog % kubectl logs -l app=vegeta -n ns-39
Error Set:
500 Internal Server Error
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 6.88ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.509ms, 7.065ms, 6.905ms, 7.97ms, 8.456ms, 9.767ms, 48.9ms
Bytes In      [total, mean]                     492367376, 3282.45
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000

% kubectl logs -l app=vegeta -n ns-40
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 6.92ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.896ms, 6.456ms, 6.227ms, 7.46ms, 8.085ms, 9.981ms, 63.878ms
Bytes In      [total, mean]                     492516810, 3283.45
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000  

% kubectl logs -l app=vegeta -n ns-41
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 7.529ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.504ms, 7.592ms, 7.396ms, 8.68ms, 9.265ms, 11.128ms, 58.271ms
Bytes In      [total, mean]                     492367368, 3282.45
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000

% kubectl logs -l app=vegeta -n ns-42
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 5.593ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.768ms, 6.041ms, 5.912ms, 6.75ms, 7.148ms, 8.313ms, 23.129ms
Bytes In      [total, mean]                     492513973, 3283.43
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000 

% kubectl logs -l app=vegeta -n ns-43
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 7.382ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.203ms, 6.7ms, 6.547ms, 7.554ms, 7.999ms, 9.348ms, 34.403ms
Bytes In      [total, mean]                     492215895, 3281.44
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000  

% kubectl logs -l app=vegeta -n ns-44
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 8.51ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.435ms, 7.415ms, 7.21ms, 8.529ms, 9.17ms, 11.064ms, 48.298ms
Bytes In      [total, mean]                     492217870, 3281.45
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000 

% kubectl logs -l app=vegeta -n ns-45
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 7.089ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.456ms, 7.226ms, 7.078ms, 8.112ms, 8.594ms, 9.927ms, 58.428ms
Bytes In      [total, mean]                     492216928, 3281.45
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000 

% kubectl logs -l app=vegeta -n ns-46
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 6.931ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.417ms, 7.137ms, 6.97ms, 8.099ms, 8.624ms, 10.037ms, 31.026ms
Bytes In      [total, mean]                     492221740, 3281.48
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000  

% kubectl logs -l app=vegeta -n ns-47
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 6.958ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.233ms, 6.849ms, 6.64ms, 7.952ms, 8.497ms, 9.793ms, 66.026ms
Bytes In      [total, mean]                     492222725, 3281.48
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000  

% kubectl logs -l app=vegeta -n ns-48
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 8.692ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.454ms, 7.037ms, 6.89ms, 7.865ms, 8.352ms, 9.74ms, 28.798ms
Bytes In      [total, mean]                     492521314, 3283.48
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000  

% kubectl logs -l app=vegeta -n ns-49
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 8.806ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.193ms, 6.659ms, 6.536ms, 7.397ms, 7.818ms, 9ms, 33.071ms
Bytes In      [total, mean]                     492380513, 3282.54
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000

% kubectl logs -l app=vegeta -n ns-50
Status Codes  [code:count]                      200:150000  
Error Set:
Requests      [total, rate, throughput]         150000, 250.00, 250.00
Duration      [total, attack, wait]             10m0s, 10m0s, 6.593ms
Latencies     [min, mean, 50, 90, 95, 99, max]  5.457ms, 7.079ms, 6.984ms, 7.716ms, 8.081ms, 9.267ms, 39.914ms
Bytes In      [total, mean]                     492666827, 3284.45
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:150000  