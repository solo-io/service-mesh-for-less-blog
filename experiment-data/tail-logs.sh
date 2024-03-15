#!/bin/bash

# Define the range of namespaces
start_namespace=1
end_namespace=50

# Define the output file
output_file="200rps-10m-50-app-istio-ambient-l4-authpol-run-data.md"

# Define label selector for pods
label_selector="app=vegeta"  # Modify this label selector as per your requirement

# Start code block
echo '```' >> "$output_file"

# Define an array of namespaces from start_namespace to end_namespace
namespaces=()

for ((i=start_namespace; i<=end_namespace; i++)); do
    namespaces+=("ns-$i")
done

# Loop through each namespace
for namespace in "${namespaces[@]}"; do
    echo "Namespace: $namespace" >> "$output_file"
    
    # Get the list of pods in the namespace with the specified label selector
    pods=$(kubectl -n "$namespace" get pods --selector="$label_selector" -o=jsonpath='{.items[*].metadata.name}')
    
    # Loop through each pod in the namespace
    for pod in $pods; do
        echo "Pod: $pod" >> "$output_file"
        
        # Get the most recent log of the pod in the namespace and append to the output file
        kubectl -n "$namespace" logs -c vegeta --tail 10 "$pod" >> "$output_file" 2>&1
        echo "" >> "$output_file"  # Add empty line after logs
    done
done

# End code block
echo '```' >> "$output_file"
