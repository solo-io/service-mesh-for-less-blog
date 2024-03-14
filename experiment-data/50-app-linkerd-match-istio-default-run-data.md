# 50 namespace linkerd run

```bash
vegeta attack -dns-ttl=0 -keepalive -http2=false -max-connections=1 -rate ${REQUESTS_PER_SECOND}/1s -duration=${DURATION} | tee results.bin | vegeta report -type=text; done
```

50 loadgenerators
200 RPS
1 connections
10 minutes

% kubectl logs -l app=vegeta -c vegeta -n ns-1  
Requests      [total, rate, throughput]         120000, 200.00, 199.37
Duration      [total, attack, wait]             10m2s, 10m0s, 1.912s
Latencies     [min, mean, 50, 90, 95, 99, max]  3.946ms, 1.419s, 1.436s, 2.677s, 2.767s, 2.797s, 2.811s
Bytes In      [total, mean]                     327168510, 2726.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-2
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.557ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.411ms, 4.201ms, 4.159ms, 4.424ms, 4.562ms, 5.04ms, 59.716ms
Bytes In      [total, mean]                     327168454, 2726.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-3
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.284ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.571ms, 4.176ms, 4.132ms, 4.432ms, 4.565ms, 4.915ms, 23.704ms
Bytes In      [total, mean]                     327408752, 2728.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-4
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.922ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.839ms, 4.661ms, 4.551ms, 5.001ms, 5.216ms, 5.916ms, 75.658ms
Bytes In      [total, mean]                     327407546, 2728.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-5
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.457ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.067ms, 4.741ms, 4.635ms, 5.115ms, 5.342ms, 6.214ms, 33.56ms
Bytes In      [total, mean]                     327648448, 2730.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-6
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.178ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.422ms, 4.327ms, 4.288ms, 4.611ms, 4.768ms, 5.251ms, 28.084ms
Bytes In      [total, mean]                     327288598, 2727.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-7
Requests      [total, rate, throughput]         120000, 200.02, 200.02
Duration      [total, attack, wait]             10m0s, 10m0s, 5.01ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.047ms, 4.8ms, 4.61ms, 5.131ms, 5.396ms, 6.343ms, 90.187ms
Bytes In      [total, mean]                     327648462, 2730.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-8
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.656ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.82ms, 4.413ms, 4.324ms, 4.619ms, 4.781ms, 5.356ms, 79.765ms
Bytes In      [total, mean]                     327288440, 2727.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-9
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.989ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.795ms, 4.626ms, 4.543ms, 4.961ms, 5.168ms, 5.816ms, 32.236ms
Bytes In      [total, mean]                     327408225, 2728.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-10
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 5.431ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.084ms, 127.155ms, 5.349ms, 391.051ms, 606.356ms, 752.473ms, 817.085ms
Bytes In      [total, mean]                     328128724, 2734.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-11
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.916ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.911ms, 385.298ms, 262.258ms, 966.681ms, 1.074s, 1.172s, 1.204s
Bytes In      [total, mean]                     328128299, 2734.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-12
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 7.162ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.1ms, 5.15ms, 4.831ms, 5.689ms, 6.227ms, 9.338ms, 43.243ms
Bytes In      [total, mean]                     328128229, 2734.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-13
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.745ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.045ms, 5.354ms, 4.82ms, 5.573ms, 5.869ms, 7.551ms, 196.348ms
Bytes In      [total, mean]                     328127789, 2734.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-14
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.732ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.957ms, 4.663ms, 4.589ms, 5.026ms, 5.238ms, 5.863ms, 25.743ms
Bytes In      [total, mean]                     328128549, 2734.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-15
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.9ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.296ms, 2.829s, 2.811s, 5.903s, 6.292s, 6.506s, 6.519s
Bytes In      [total, mean]                     328129095, 2734.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-16
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.537ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.049ms, 5.055ms, 4.802ms, 5.569ms, 5.905ms, 8.657ms, 32.693ms
Bytes In      [total, mean]                     328126890, 2734.39
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-17
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.664ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.168ms, 4.856ms, 4.744ms, 5.306ms, 5.529ms, 6.329ms, 28.132ms
Bytes In      [total, mean]                     328127364, 2734.39
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-18
Requests      [total, rate, throughput]         120000, 200.00, 198.93
Duration      [total, attack, wait]             10m3s, 10m0s, 3.225s
Latencies     [min, mean, 50, 90, 95, 99, max]  4.33ms, 4.27s, 4.763s, 7.62s, 7.927s, 8.088s, 8.128s
Bytes In      [total, mean]                     328128893, 2734.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-19
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 5.021ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.952ms, 4.757ms, 4.662ms, 5.154ms, 5.4ms, 6.3ms, 26.937ms
Bytes In      [total, mean]                     328128050, 2734.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-20
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 5.394ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.292ms, 6.3ms, 5.036ms, 7.604ms, 12.605ms, 30.247ms, 41.466ms
Bytes In      [total, mean]                     328129184, 2734.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-21
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 5.243ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.77ms, 282.887ms, 5.709ms, 901.28ms, 1.012s, 1.199s, 1.233s
Bytes In      [total, mean]                     328130441, 2734.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-22
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.394ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.946ms, 4.658ms, 4.58ms, 5.029ms, 5.258ms, 5.86ms, 31.086ms
Bytes In      [total, mean]                     328128650, 2734.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-23
Requests      [total, rate, throughput]         120000, 200.00, 194.07
Duration      [total, attack, wait]             10m18s, 10m0s, 18.343s
Latencies     [min, mean, 50, 90, 95, 99, max]  4.477ms, 10.752s, 12.621s, 18.718s, 18.778s, 18.852s, 18.884s
Bytes In      [total, mean]                     328129424, 2734.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-24
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 12.337ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.194ms, 618.416ms, 759.562ms, 1.359s, 1.508s, 1.617s, 1.636s
Bytes In      [total, mean]                     328128258, 2734.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-25
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 5.109ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.889ms, 9.316ms, 5.119ms, 17.397ms, 40.541ms, 66.252ms, 79.762ms
Bytes In      [total, mean]                     328128884, 2734.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-26
Requests      [total, rate, throughput]         120000, 200.00, 199.41
Duration      [total, attack, wait]             10m2s, 10m0s, 1.791s
Latencies     [min, mean, 50, 90, 95, 99, max]  4.282ms, 2.145s, 2.374s, 3.89s, 4.102s, 4.225s, 4.236s
Bytes In      [total, mean]                     328129496, 2734.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-27
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.626ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.224ms, 129.287ms, 5.967ms, 462.102ms, 664.901ms, 721.297ms, 733.01ms
Bytes In      [total, mean]                     328128686, 2734.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-28
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.245ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.725ms, 4.354ms, 4.286ms, 4.573ms, 4.722ms, 5.139ms, 84.962ms
Bytes In      [total, mean]                     328127304, 2734.39
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-29
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.264ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.629ms, 4.238ms, 4.191ms, 4.469ms, 4.611ms, 5.17ms, 30.993ms
Bytes In      [total, mean]                     328128074, 2734.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-30
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.067ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.546ms, 4.263ms, 4.204ms, 4.499ms, 4.647ms, 5.187ms, 60.699ms
Bytes In      [total, mean]                     328128514, 2734.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-31
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 3.894ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.538ms, 4.18ms, 4.136ms, 4.416ms, 4.548ms, 5.024ms, 53.432ms
Bytes In      [total, mean]                     328128349, 2734.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-32
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.428ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.962ms, 4.725ms, 4.629ms, 5.067ms, 5.257ms, 5.846ms, 61.379ms
Bytes In      [total, mean]                     328609027, 2738.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-33
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.84ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.585ms, 4.901ms, 4.787ms, 5.412ms, 5.623ms, 6.52ms, 33.229ms
Bytes In      [total, mean]                     328248916, 2735.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-34
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.542ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.829ms, 5.053ms, 4.831ms, 5.414ms, 5.665ms, 7.535ms, 36.937ms
Bytes In      [total, mean]                     328608239, 2738.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-35
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.902ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.991ms, 10.31ms, 4.954ms, 11.626ms, 41.474ms, 117.665ms, 170.151ms
Bytes In      [total, mean]                     328247046, 2735.39
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-36
Requests      [total, rate, throughput]         120000, 200.00, 199.99
Duration      [total, attack, wait]             10m0s, 10m0s, 37.393ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.606ms, 140.458ms, 22.311ms, 409.627ms, 502.598ms, 588.225ms, 655.748ms
Bytes In      [total, mean]                     328127894, 2734.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-37
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.631ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.67ms, 161.429ms, 73.319ms, 452.043ms, 545.464ms, 638.35ms, 729.667ms
Bytes In      [total, mean]                     328127302, 2734.39
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-38
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 6.882ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.694ms, 16.79ms, 6.1ms, 39.388ms, 66.959ms, 151.752ms, 280.981ms
Bytes In      [total, mean]                     328127648, 2734.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-39
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 16.737ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.732ms, 6.02ms, 5.023ms, 6.682ms, 7.83ms, 23.89ms, 99.834ms
Bytes In      [total, mean]                     328369628, 2736.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-40
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.641ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.95ms, 4.619ms, 4.495ms, 4.956ms, 5.219ms, 6.117ms, 71.209ms
Bytes In      [total, mean]                     328487465, 2737.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-41 
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.833ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.931ms, 4.498ms, 4.439ms, 4.76ms, 4.933ms, 5.381ms, 33.64ms
Bytes In      [total, mean]                     328608930, 2738.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-42
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.564ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.999ms, 4.782ms, 4.628ms, 5.071ms, 5.285ms, 6.097ms, 108.927ms
Bytes In      [total, mean]                     328367964, 2736.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-43
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.379ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.709ms, 4.491ms, 4.431ms, 4.842ms, 5.05ms, 5.636ms, 27.686ms
Bytes In      [total, mean]                     328726425, 2739.39
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 


alexly-solo@Solo-System-ALy linkerd-ambient-blog % kubectl logs -l app=vegeta -c vegeta -n ns-44
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.492ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.818ms, 4.696ms, 4.562ms, 5.039ms, 5.302ms, 6.486ms, 30.269ms
Bytes In      [total, mean]                     328727983, 2739.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-45
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.408ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.89ms, 4.572ms, 4.428ms, 4.843ms, 5.065ms, 5.823ms, 106.704ms
Bytes In      [total, mean]                     328725949, 2739.38
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-46
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.449ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.826ms, 4.572ms, 4.434ms, 4.848ms, 5.056ms, 5.901ms, 82.837ms
Bytes In      [total, mean]                     328728031, 2739.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-47
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.472ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.7ms, 4.392ms, 4.235ms, 4.559ms, 4.718ms, 5.238ms, 129.638ms
Bytes In      [total, mean]                     328726394, 2739.39
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

% kubectl logs -l app=vegeta -c vegeta -n ns-48
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.672ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.865ms, 4.664ms, 4.423ms, 4.82ms, 5.051ms, 5.818ms, 156.056ms
Bytes In      [total, mean]                     328726930, 2739.39
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

% kubectl logs -l app=vegeta -c vegeta -n ns-49
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.999ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.781ms, 4.514ms, 4.376ms, 4.686ms, 4.849ms, 5.343ms, 117.811ms
Bytes In      [total, mean]                     328367701, 2736.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

% kubectl logs -l app=vegeta -c vegeta -n ns-50
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.552ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.909ms, 4.662ms, 4.447ms, 4.78ms, 4.955ms, 5.483ms, 146.631ms
Bytes In      [total, mean]                     328248035, 2735.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 