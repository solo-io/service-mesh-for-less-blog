# Create a new cluster

## Set core cluster variables
GKE_CLUSTER_NAME="gke-linkerd-1"
GKE_CLUSTER_ZONE="us-east1-b"
MAIN_MACHINE_TYPE="n2-standard-16"
MAIN_NUM_NODES=""
GKE_PROJECT=""
CLUSTER_VERSION="1.28.3-gke.1118000"

# Create Cluster
gcloud container clusters create ${GKE_CLUSTER_NAME} \
  --cluster-version ${CLUSTER_VERSION} \
  --no-enable-autoupgrade \
  --machine-type=${MAIN_MACHINE_TYPE} \
  --num-nodes ${MAIN_NUM_NODES} \
  --zone ${GKE_CLUSTER_ZONE} \
  --project ${GKE_PROJECT} \
  --logging NONE \
  --spot

Note: can add NodeLocalDNS with the following flag, but also turning on keep-alives on the client helps relieve kube-dns
  --addons=NodeLocalDNS \  

# resize default pool
gcloud container clusters resize ${GKE_CLUSTER_NAME} --zone ${GKE_CLUSTER_ZONE} --num-nodes 0 --node-pool default-pool


# delete
GKE_CLUSTER_NAME="gke-linkerd-1"
gcloud container clusters delete ${GKE_CLUSTER_NAME} --zone ${GKE_CLUSTER_ZONE} --project ${GKE_PROJECT}

# Load Generator Node Pool (spot)

## new node pool variables
GKE_NODE_POOL_NAME="gke-linkerd-1-lg-spot-16cpu"
POOL_MACHINE_TYPE="n2-standard-16"
POOL_NUM_NODES="1"
POOL_MIN_NODES="1"
POOL_MAX_NODES="6"
POOL_NODE_TAINTS="cloud.google.com/node="loadgen":NoSchedule"
POOL_NODE_LABELS="node="loadgen""

# Create the node pool
gcloud container node-pools create ${GKE_NODE_POOL_NAME} \
  --cluster ${GKE_CLUSTER_NAME} \
  --zone ${GKE_CLUSTER_ZONE} \
  --project ${GKE_PROJECT} \
  --num-nodes=${POOL_NUM_NODES} \
  --enable-autoscaling \
  --min-nodes=${POOL_MIN_NODES} \
  --max-nodes=${POOL_MAX_NODES} \
  --machine-type=${POOL_MACHINE_TYPE} \
  --node-taints=${POOL_NODE_TAINTS} \
  --node-labels=${POOL_NODE_LABELS} \
  --spot

# enable NodeLocal DNSCache
gcloud container clusters update ${GKE_CLUSTER_NAME} \
    --zone ${GKE_CLUSTER_ZONE} \
    --project ${GKE_PROJECT} \
    --update-addons=NodeLocalDNS=ENABLED

# scale kube-dns
kubectl edit configmap kube-dns-autoscaler --namespace=kube-system

To scale up, change nodesPerReplica to a smaller value and include a min and max value.
nodesPerReplica: 2
min: 5
max: 10

linear: '{"coresPerReplica":256, "nodesPerReplica":4,"max": 15,"min": 5,"preventSinglePointFailure":true}'

# other notes

### add a toleration to loadgenerator deployment
nodeSelector:
  node: "loadgen"
tolerations:
- key: cloud.google.com/node
  operator: Equal
  value: "loadgen"
  effect: NoSchedule  