# Create a new cluster

## Set core cluster variables

Set the following variables for cluster name, zone, machine type, number of nodes, k8s version, and the target GKE project
```
GKE_CLUSTER_NAME="gke-ambient-1"
GKE_CLUSTER_ZONE="us-west4-b"
MAIN_MACHINE_TYPE="n2-standard-8"
MAIN_NUM_NODES=""
GKE_PROJECT=""
CLUSTER_VERSION="1.28.3-gke.1118000"
```

# Create Cluster

Create the cluster. Omit the `--spot` flag if you do not want to use spot instances
```
gcloud container clusters create ${GKE_CLUSTER_NAME} \
  --cluster-version ${CLUSTER_VERSION} \
  --no-enable-autoupgrade \
  --machine-type=${MAIN_MACHINE_TYPE} \
  --num-nodes ${MAIN_NUM_NODES} \
  --zone ${GKE_CLUSTER_ZONE} \
  --project ${GKE_PROJECT} \
  --logging NONE \
  --spot
```

# Load Generator Node Pool (spot)

## new node pool variables

Set the following node pool variables for autoscaling, node labels, and taints
```
GKE_NODE_POOL_NAME="gke-ambient-1-lg-spot-8cpu"
POOL_MACHINE_TYPE="n2-standard-8"
POOL_NUM_NODES="5"
POOL_MIN_NODES="1"
POOL_MAX_NODES="6"
POOL_NODE_TAINTS="cloud.google.com/node="loadgen":NoSchedule"
POOL_NODE_LABELS="node="loadgen""
```

# Create the node pool

This creates a node pool with node labels and taints specified above
```
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
```

# resize default pool

This is useful if you want to scale down a particular node pool, in this case the `default-pool`
```
gcloud container clusters resize ${GKE_CLUSTER_NAME} --zone ${GKE_CLUSTER_ZONE} --num-nodes 0 --node-pool default-pool
```

# delete

To delete the cluster run the following command
```
gcloud container clusters delete ${GKE_CLUSTER_NAME} --zone ${GKE_CLUSTER_ZONE} --project ${GKE_PROJECT}
```