# Ambient Mesh - Doing More for Less!

With the introduction of Istio Ambient mesh, platform teams can more efficiently adopt service mesh features without introducing a significant resource overhead to their end consumers.

Here at Solo.io a common story that we hear among our customer-base and prospects that goes like this:
"The Security team has mandated a zero-trust posture across the entire organization, and as a result of this requirement I am looking to adopt a service mesh. However, in doing some research we have discovered that leveraging a sidecar based approach will incur some additional cost in resource reservations per app (by default in Istio 100m CPU and 128Mi MEM per sidecar), and operational overhead in managing the lifecycle of a sidecar deployment"

For teams with tight budgets, complying with this mandate presents significant opportunity costs. Trade-offs such as deciding between hiring additional staff or investing in other areas of the business versus bearing the increased cost of resources for the application becomes a critical consideration.

In conversations with those further along in their service mesh journey, it's often highlighted that the sidecar pattern offers an array of L7 capabilities, including:
- Advanced traffic management and routing control
- Native support for mutual Transport Layer Security (mTLS) in the ingress solution
- Fine-grained security policies at the application layer
- Efficient handling of circuit breaking and fault tolerance mechanisms
- Facilitated implementation of service discovery and dynamic service routing
- Simplified deployment of A/B testing and canary release strategies

But what if the user doesn't need these capabilities immediate near-term? Despite their potential benefits to the organization, the overhead costs of implementing and maintaining these additional value-add features also come at an expense and require a level of organizational maturity. Moreover, the costs are incurred regardless of their utilization, potentially pressuring the team to prioritize these features even if they're merely nice-to-haves.

# Ambient Mesh
[Ambient mesh](https://www.solo.io/blog/istio-ambient-mesh-evolution-service-mesh/) was launched on September 7th, 2022, introducing a new Istio data plane mode without sidecars that’s designed for simplified operations, broader application compatibility, and reduced infrastructure cost. Ambient splits Istio’s functionality into two distinct layers: the zero trust secure overlay layer, and optional Layer 7 processing layer. Compared with sidecars, the layered approach allows users to adopt Istio incrementally from no mesh, to the secure overlay, to full L7 processing as needed. This gives service mesh users two outstanding options from the same dedicated community: Istio with a sidecar model approach, or sidecarless Ambient mesh.

![ambient-mesh-architecture](.images/Istio-Ambient-Mesh-Zero-Trust-Security-1024x528.png)


Now, returning to our original problem statement, in order to comply with the zero-trust mandate from Security, we no longer need to adopt a sidecar per application. Instead, we can leverage Ambient mode's `ztunnel` per-node architecture, which separates the responsibilities of zero-trust networking and Layer 7 policy handling. The resource costs associated with these components are as follows:

Istio Component Resource Requirements (all configurable for smaller deployments):
- ztunnel - `500m` CPU and `2048Mi` memory per node
- istio-cni - `100m` and `100Mi` memory per node
- istiod - `500m` and `2Gi` memory per replica

Ambient mode enables us to meet the mTLS requirement with a model that is less coupled to the resource costs of individual applications and instead scales with the cost of platform itself (more nodes, more `ztunnels`). With this approach, Application Owners no longer need to concern themselves with the presence of a sidecar in their workload, the lifecycle of that sidecar, and even the cost of the sidecar resource. Users of the sidecarless service mesh can assume that if the application is deployed on the cluster, it is inherently secure by default. Developers can then focus on developing and deploying their applications, increasing operational efficiency and providing a more seamless and frictionless developer productivity experience.

# Let's look at some numbers

Lets take the following application for our large scale application experiment:

Application Details:
- 50 namespace isolated applications
- 3-tier application structure
    - 4 deployments per namespace, 1 replicas per deployment 
    - A > B1,B2 > C
    - CPU requests: 700m // CPU limits: 700m (guaranteed QoS)
    - MEM requests: 500Mi // MEM limits: 500Mi (guaranteed QoS)

Load Generator Details:
- Load generator per namespace targeting tier 1 application level
  - deployed to separate loadgen node pool
  - using n2-standard-8 spot instances in autoscaling mode 1-6 nodes
  - RPS tuned with 25 connections
  - CPU requests: 500m // CPU limits: 500m (guaranteed QoS)
  - MEM requests: 300Mi // MEM limits: 300Mi (guaranteed QoS)

Baseline Resource Requirements:
When calculating the baseline resource requirements without service mesh enabled:
- Total application baseline requirements are 140 CPU cores and 100 GB memory
- Total load generator baseline requirements are 25 CPU cores and 15 GB memory

Total expected baseline requirements: 165 CPU Cores and 115 GB memory

A high level architecture looks like this:

![performance-architecture-2](.images/performance-architecture-2.png)

## In an ideal bin packing scenario

![tetris-1](.images/tetris-1.png)

In an ideal world, where everything is perfectly scheduled like an expert tetris player, our capacity planning exercise would be a rather simple calculation

![baseline-requirements-1](.images/baseline-requirements-1.png)

Source: using the [Google Cloud Pricing Calculator](https://cloud.google.com/products/calculator?hl=en)

## Reality is not an ideal bin packing scenario

![tetris-1](.images/tetris-2.png)

In reality, Kubernetes scheduling is not perfect, and inefficiencies in bin packing workloads will result in additional resources consumed (nodes created) so that all workloads can be scheduled. The following table shows the actual results of deploying the example application described in our test environment:

![bin-packing-2](.images/bin-packing-2.png)

The results mirror the goals of the Ambient project in both simplifying operations of the service mesh (no sidecars!) as well as reducing infrastructure costs (no additional cost to fulfill mTLS requirement). We also see an added benefit where if we decide to incrementally adopt the full L7 feature set by adopting waypoint proxies, the cost would be +18% from baseline using `ztunnel` + waypoint proxies vs. the traditional sidecar approach at +36%

# Simplifying Operations

![sidecar-1](.images/sidecar-1.png)

One of the most common challenges that we see with service mesh adoption is the increase in operational overhead to manage the lifecycle of the sidecar for the Platform or Application owners. This challenge becomes particularly pronounced during proxy upgrades, such as transitioning from version 1.19 to 1.20 as depicted above

With a sidecar approach, users need to ensure that Kubernetes + proxy is configured to do the following:
- Initiate the draining process and stop accepting new connections
- Ensure that all connections are drained before termination
- Configure the Kubernetes scheduler to avoid premature pod termination
- Terminate early if all active connections close

All of these considerations go away when adopting a sidecarless service mesh architecture! This new approach significantly reduces this operational burden, providing more time for developers to focus on developing application features rather than infrastructure related concerns of managing proxies at scale.

# What about Performance?

With the premise of this blog post focused on doing more for less, we have already covered two initial goals of Ambient mesh in reducing infrastructure cost as well as simplifying operations, but what about performance?

Taking the example app above, we ran the following experiment to validate that Ambient mesh can perform at-par or better than the traditional sidecar based approach. For this test, we evaluated the same application deployed on a cluster with LinkerD against a cluster with Istio Ambient Mesh.

First we set some baseline performance requirements for our 3-tier application workload that is deployed across 50 namespaces. 

Our application latency expectations:
- Average latency < 40ms
- Max latency < 200ms
- Expected CPU utilization tuned to around 20-40% (visualized in GKE Observability)

We configured a Vegeta loadgenerator client per-namespace with a guaranteed QoS by setting resource requests/limits to `500m` CPU and `300Mi` MEM for this experiment:

Our Loadgenerator Client Configuration:
- Load generator per namespace targeting tier 1 application level
  - deployed to separate loadgen node pool
  - using n2-standard-8 spot instances in autoscaling mode 1-6 nodes
  - Each loadgen client is configured at 200 RPS
  - CPU requests: 500m // CPU limits: 500m (guaranteed QoS)
  - MEM requests: 300Mi // MEM limits: 300Mi (guaranteed QoS)

## LinkerD Run 1

Starting with LinkerD, we noticed that by default there are no proxy resource requests/limits defined, unlike Istio which sets the default sidecar proxy resource requests to `100m` CPU and `128Mi` MEM.

A of the test produced results similar to the following:
```bash
Namespace: ns-3
Pod: vegeta-ns-3-76f777497-7bpnc
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 5.214ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.01ms, 4.968ms, 4.766ms, 5.138ms, 5.273ms, 5.675ms, 486.653ms
Bytes In      [total, mean]                     327889353, 2732.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

Namespace: ns-4
Pod: vegeta-ns-4-656567db4-t9gpc
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 5.875ms
Latencies     [min, mean, 50, 90, 95, 99, max]  4.133ms, 5.227ms, 5.127ms, 5.864ms, 6.177ms, 6.942ms, 24.577ms
Bytes In      [total, mean]                     327889731, 2732.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  
```

What we observed was that without proper resource requests defined the mean, p50-99 latency percentiles were meeting our expectations, but max latency was high in just a few namespaces. Not a a big deal, these are great numbers! But typically we would expect to guarantee some amount of resources to the proxy in order to avoid issues, so we'll explore this further in the next experiments to see if we do see any improvements when setting proxy resources. Overall though, pretty satisfied with the sub 4-8ms p99 latency!

## LinkerD Run 2

We then tested setting LinkerD proxy resources to match the default resources set by Istio at `100m` CPU and `128Mi` MEM per proxy with the helm values
```bash
--set proxy.cores=16
--set proxy.resources.cpu.request=100m
--set proxy.resources.memory.request=128Mi
```

The observed results were in line with our performance criteria, with all 50 namespaces within the latency requirements expected for this experiment. Max latency was under our target of `200ms` and we also find that our P50-99 latency is sub `3-6ms`. Overall, it looks like configuring the proxy resource requirements did help the overall stability of our latency distribution

A re-run of the test produced results similar to the following:
```bash
Namespace: ns-1
Pod: vegeta-ns-1-546cbfb494-w2c6j
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.449ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.75ms, 4.622ms, 4.586ms, 5.011ms, 5.139ms, 5.496ms, 55.701ms
Bytes In      [total, mean]                     327767428, 2731.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

Namespace: ns-10
Pod: vegeta-ns-10-695785d45d-sfrbr
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 5.123ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.954ms, 4.619ms, 4.584ms, 4.919ms, 5.045ms, 5.334ms, 32.461ms
Bytes In      [total, mean]                     328727494, 2739.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

Namespace: ns-20
Pod: vegeta-ns-20-74586d4bbf-mddqf
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 5.356ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.542ms, 4.288ms, 4.215ms, 4.73ms, 4.879ms, 5.186ms, 57.637ms
Bytes In      [total, mean]                     328727636, 2739.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

Namespace: ns-30
Pod: vegeta-ns-30-74dc6b75b-cmg2p
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.098ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.593ms, 4.73ms, 4.751ms, 5.086ms, 5.187ms, 5.527ms, 14.241ms
Bytes In      [total, mean]                     328847277, 2740.39
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

Namespace: ns-40
Pod: vegeta-ns-40-767f8b695f-qzw27
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.815ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.973ms, 4.886ms, 4.874ms, 5.228ms, 5.352ms, 5.698ms, 46.946ms
Bytes In      [total, mean]                     328849046, 2740.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

Namespace: ns-50
Pod: vegeta-ns-50-75f989684b-nq7dw
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 4.524ms
Latencies     [min, mean, 50, 90, 95, 99, max]  3.496ms, 4.659ms, 4.61ms, 5.196ms, 5.388ms, 5.745ms, 45.911ms
Bytes In      [total, mean]                     329328436, 2744.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000
```

Below we can see the 30 minute history cluster CPU dashboard for this test run as shown in the GKE console

![50-app-linkerd-gke-observability.png](.images/50-app-linkerd-gke-observability.png)

# Ambient Run 1

With Ambient, we don't have to worry about the sidecar proxy or its resources, so the test is rather simple:
- Deploy the applications
- Run the load generator clients

Running the same test that we did previously, we produced results similar to the following:

```bash
Namespace: ns-1
Pod: vegeta-ns-1-6b674f44dc-hkpvp
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.833ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.156ms, 2.758ms, 2.734ms, 3.004ms, 3.105ms, 3.375ms, 35.071ms
Bytes In      [total, mean]                     327167693, 2726.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

Namespace: ns-10
Pod: vegeta-ns-10-5648ff7589-cq4cx
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.416ms
Latencies     [min, mean, 50, 90, 95, 99, max]  1.951ms, 2.676ms, 2.649ms, 2.928ms, 3.036ms, 3.3ms, 57.993ms
Bytes In      [total, mean]                     327768457, 2731.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000

Namespace: ns-20
Pod: vegeta-ns-20-58f4b96874-k8rps
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.567ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.228ms, 2.823ms, 2.799ms, 3.076ms, 3.183ms, 3.465ms, 34.041ms
Bytes In      [total, mean]                     328128218, 2734.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  

Namespace: ns-30
Pod: vegeta-ns-30-777b9cbc95-6f4lq
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 3.219ms
Latencies     [min, mean, 50, 90, 95, 99, max]  2.122ms, 2.788ms, 2.767ms, 3.031ms, 3.134ms, 3.415ms, 25.038ms
Bytes In      [total, mean]                     327888797, 2732.41
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

Namespace: ns-40
Pod: vegeta-ns-40-5c4c4f967b-tbvmz
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.8ms
Latencies     [min, mean, 50, 90, 95, 99, max]  1.893ms, 2.589ms, 2.564ms, 2.857ms, 2.968ms, 3.253ms, 19.25ms
Bytes In      [total, mean]                     327887404, 2732.40
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000 

Namespace: ns-50
Pod: vegeta-ns-50-6d6bd5dcc-5wwjt
Status Codes  [code:count]                      200:120000  
Error Set:
Requests      [total, rate, throughput]         120000, 200.00, 200.00
Duration      [total, attack, wait]             10m0s, 10m0s, 2.334ms
Latencies     [min, mean, 50, 90, 95, 99, max]  1.909ms, 2.497ms, 2.474ms, 2.724ms, 2.823ms, 3.076ms, 39.393ms
Bytes In      [total, mean]                     328130110, 2734.42
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:120000  
```

Without any tuning of the default Ambient mesh settings, we achieved our application latency performance requirements on the first run test run! Additionally, we can see the apparent benefits of sidecarless with our latency distribution in the sub `2-4ms` range for P50-P99 with network encryption secured over mTLS at a mesh-wide 10K RPS!

Below we can see the 30 minute history cluster CPU dashboard for this test run as shown in the GKE console

![50-app-ambient-gke-l4-observability.png](.images/50-app-ambient-gke-l4-observability.png)

# Conclusion

In this blog we explored three main value propositions for Istio Ambient Mesh
- Simplify operations of the service mesh
- Reduce infrastructure costs
- Improved resource utilization and application performance

In our hypothetical scenario detailed in this experiment, the adoption of Ambient mesh fulfills the mTLS mandate that was implemented by the Security team without imposing any additional cost to the Application team. Furthermore, adopting a sidecarless architecture additionally reduces the operational overhead to truly be "ambient" for the developer persona. As a result, the organization as a whole benefits from the improved resource utilization while maintaining or even improving application performance. It is clear here that we are benefitting while doing more for less!

As Solo.io is a co-founder of the Istio ambient sidecar-less architecture and leads the development upstream in the Istio community, we are uniquely positioned to help our customers adopt this architecture for production security and compliance requirements. [Please reach out to us to talk with an expert.](https://www.solo.io/company/contact/)






