# 50 namespace linkerd run

```bash
vegeta attack -dns-ttl=0 -keepalive -http2=false -max-connections=1 -rate ${REQUESTS_PER_SECOND}/1s -duration=${DURATION} | tee results.bin | vegeta report -type=text; done
```

50 loadgenerators
200 RPS
1 connections
10 minutes

% kubectl logs -l app=vegeta -c vegeta -n ns-1
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.638ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.073ms, 4.844ms, 4.726ms, 5.277ms, 5.549ms, 6.004ms, 55.691ms
Bytes In      [total, mean]                     327768040, 2731.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-2
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 5.375ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.095ms, 4.759ms, 4.673ms, 5.115ms, 5.36ms, 5.851ms, 39.916ms
Bytes In      [total, mean]                     327647237, 2730.39
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-3
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.185ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.581ms, 4.412ms, 4.319ms, 4.746ms, 4.935ms, 5.592ms, 65.243ms
Bytes In      [total, mean]                     327768624, 2731.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-4
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.233ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.698ms, 4.737ms, 4.582ms, 5.223ms, 5.577ms, 6.618ms, 60.573ms
Bytes In      [total, mean]                     327770991, 2731.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-5
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.401ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.761ms, 4.639ms, 4.548ms, 5.065ms, 5.371ms, 6.23ms, 16.183ms
Bytes In      [total, mean]                     327410533, 2728.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-6
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.502ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.76ms, 4.551ms, 4.488ms, 4.932ms, 5.158ms, 5.721ms, 14.589ms
Bytes In      [total, mean]                     327049575, 2725.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-7
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.331ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.343ms, 4.183ms, 4.1ms, 4.556ms, 4.793ms, 5.832ms, 22.777ms
Bytes In      [total, mean]                     326567826, 2721.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-8
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.147ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.369ms, 4.17ms, 4.089ms, 4.541ms, 4.769ms, 5.743ms, 19.634ms
Bytes In      [total, mean]                     326927663, 2724.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-9
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.265ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.343ms, 4.173ms, 4.086ms, 4.559ms, 4.802ms, 5.872ms, 23.878ms
Bytes In      [total, mean]                     327167544, 2726.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-10 
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.704ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.944ms, 4.71ms, 4.61ms, 5.033ms, 5.234ms, 5.699ms, 56.531ms
Bytes In      [total, mean]                     328369889, 2736.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-11
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.611ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.875ms, 4.556ms, 4.501ms, 4.869ms, 5.053ms, 5.523ms, 27.158ms
Bytes In      [total, mean]                     328728549, 2739.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-12
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.631ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.995ms, 4.737ms, 4.646ms, 5.107ms, 5.335ms, 5.809ms, 51.542ms
Bytes In      [total, mean]                     328485983, 2737.38
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-13
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 5.138ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.914ms, 4.718ms, 4.625ms, 5.133ms, 5.424ms, 6.092ms, 25.144ms
Bytes In      [total, mean]                     328489098, 2737.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-14
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.342ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.044ms, 4.736ms, 4.641ms, 5.085ms, 5.31ms, 5.861ms, 49.501ms
Bytes In      [total, mean]                     328609954, 2738.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-15
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.98ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.119ms, 5.023ms, 4.826ms, 5.401ms, 5.716ms, 8.351ms, 68.132ms
Bytes In      [total, mean]                     328608213, 2738.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-16
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.341ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.928ms, 4.698ms, 4.612ms, 5.036ms, 5.242ms, 5.788ms, 55.839ms
Bytes In      [total, mean]                     328608145, 2738.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-17
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.426ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.94ms, 4.688ms, 4.609ms, 5.088ms, 5.322ms, 5.852ms, 28.469ms
Bytes In      [total, mean]                     328370661, 2736.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-18
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.441ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.849ms, 4.576ms, 4.518ms, 4.881ms, 5.072ms, 5.547ms, 34.505ms
Bytes In      [total, mean]                     328728966, 2739.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-19
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.522ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.999ms, 5.237ms, 4.791ms, 5.651ms, 6.305ms, 14.644ms, 73.653ms
Bytes In      [total, mean]                     328369285, 2736.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-20
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.317ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.892ms, 4.457ms, 4.407ms, 4.718ms, 4.871ms, 5.243ms, 39.458ms
Bytes In      [total, mean]                     328484994, 2737.37
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-21
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.725ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.142ms, 5.039ms, 4.856ms, 5.672ms, 5.98ms, 7.301ms, 44.632ms
Bytes In      [total, mean]                     328489547, 2737.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-22
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.574ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.975ms, 4.581ms, 4.522ms, 4.907ms, 5.078ms, 5.58ms, 23.626ms
Bytes In      [total, mean]                     328607541, 2738.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-23
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.491ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.891ms, 4.517ms, 4.47ms, 4.827ms, 5ms, 5.384ms, 13.865ms
Bytes In      [total, mean]                     328489182, 2737.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-24
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.586ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.164ms, 5.116ms, 4.887ms, 5.647ms, 6.274ms, 9.553ms, 35.609ms
Bytes In      [total, mean]                     328609818, 2738.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-25
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.88ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.921ms, 4.611ms, 4.556ms, 4.953ms, 5.157ms, 5.604ms, 12.768ms
Bytes In      [total, mean]                     328489922, 2737.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-26
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.669ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.06ms, 4.852ms, 4.743ms, 5.326ms, 5.595ms, 6.062ms, 38.526ms
Bytes In      [total, mean]                     328728207, 2739.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-27
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.455ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.868ms, 4.485ms, 4.443ms, 4.75ms, 4.912ms, 5.288ms, 26.751ms
Bytes In      [total, mean]                     328485536, 2737.38
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-28
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 5.756ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.962ms, 4.845ms, 4.738ms, 5.369ms, 5.645ms, 6.19ms, 15.744ms
Bytes In      [total, mean]                     328490144, 2737.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%

% kubectl logs -l app=vegeta -c vegeta -n ns-29
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.271ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.892ms, 4.558ms, 4.5ms, 4.892ms, 5.073ms, 5.571ms, 13.597ms
Bytes In      [total, mean]                     328608829, 2738.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-30
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.748ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.112ms, 4.888ms, 4.761ms, 5.401ms, 5.689ms, 6.212ms, 41.067ms
Bytes In      [total, mean]                     328609303, 2738.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-31
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.689ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.893ms, 4.662ms, 4.579ms, 5.003ms, 5.231ms, 5.786ms, 57.722ms
Bytes In      [total, mean]                     328368685, 2736.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-32
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.593ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.871ms, 4.458ms, 4.42ms, 4.726ms, 4.869ms, 5.232ms, 14.367ms
Bytes In      [total, mean]                     328725281, 2739.38
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-33
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.768ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.935ms, 4.708ms, 4.598ms, 5.037ms, 5.266ms, 5.941ms, 72.387ms
Bytes In      [total, mean]                     328490113, 2737.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-34
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.871ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.995ms, 4.883ms, 4.747ms, 5.39ms, 5.67ms, 6.241ms, 61.342ms
Bytes In      [total, mean]                     328608812, 2738.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-35
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.537ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.949ms, 4.561ms, 4.512ms, 4.856ms, 5.023ms, 5.394ms, 13.16ms
Bytes In      [total, mean]                     328607142, 2738.39
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-36
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 5.163ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.909ms, 4.665ms, 4.586ms, 5.065ms, 5.318ms, 5.881ms, 18.616ms
Bytes In      [total, mean]                     328611252, 2738.43
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-37
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.477ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.993ms, 4.634ms, 4.561ms, 4.955ms, 5.16ms, 5.587ms, 48.095ms
Bytes In      [total, mean]                     328369584, 2736.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-38
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.222ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.564ms, 4.291ms, 4.248ms, 4.588ms, 4.742ms, 5.205ms, 29.92ms
Bytes In      [total, mean]                     328368781, 2736.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-39
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.197ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.843ms, 4.743ms, 4.639ms, 5.204ms, 5.492ms, 6.433ms, 30.18ms
Bytes In      [total, mean]                     328491501, 2737.43
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-40
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 3.534ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.256ms, 4.03ms, 3.975ms, 4.346ms, 4.478ms, 4.891ms, 42.394ms
Bytes In      [total, mean]                     328727224, 2739.39
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-41
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 3.762ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.292ms, 4.022ms, 3.971ms, 4.342ms, 4.473ms, 4.869ms, 27.662ms
Bytes In      [total, mean]                     328727497, 2739.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-42
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.284ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.247ms, 3.969ms, 3.918ms, 4.306ms, 4.443ms, 4.834ms, 26.353ms
Bytes In      [total, mean]                     329087355, 2742.39
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-43
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.188ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.762ms, 4.562ms, 4.502ms, 4.908ms, 5.107ms, 5.595ms, 53.405ms
Bytes In      [total, mean]                     328612336, 2738.44
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-44
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.267ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.823ms, 475.28ms, 132.434ms, 1.717s, 2.261s, 2.522s, 2.563s
Bytes In      [total, mean]                     328490758, 2737.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-45
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.406ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.84ms, 4.689ms, 4.612ms, 5.089ms, 5.316ms, 5.939ms, 50.864ms
Bytes In      [total, mean]                     328611341, 2738.43
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-46
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 6.799ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.859ms, 142.817ms, 5.732ms, 605.383ms, 996.58ms, 1.141s, 1.173s
Bytes In      [total, mean]                     328610284, 2738.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-47
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.179ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.918ms, 5.475ms, 4.8ms, 5.84ms, 7.101ms, 22.225ms, 61.761ms
Bytes In      [total, mean]                     328370774, 2736.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-48
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.377ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.843ms, 4.657ms, 4.567ms, 4.99ms, 5.191ms, 5.719ms, 64.128ms
Bytes In      [total, mean]                     328610736, 2738.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-49
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.099ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.834ms, 4.923ms, 4.598ms, 5.116ms, 5.414ms, 7.451ms, 101.286ms
Bytes In      [total, mean]                     328370635, 2736.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-50
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.406ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.689ms, 4.549ms, 4.489ms, 4.938ms, 5.164ms, 5.835ms, 11.804ms
Bytes In      [total, mean]                     328491167, 2737.43
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  