#!/bin/bash

while true
do
    POD=$(kubectl get pods \
      -o jsonpath='{.items[*].metadata.name}' \
      | tr ' ' '\n' \
      | shuf -n 1)

    echo "Deleting pod: $POD"

    kubectl delete pod $POD

    sleep 10
done