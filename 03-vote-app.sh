#!/usr/bin/env bash


# Deploy sample APP

kubectl apply -f azure-vote.yaml

# Wait for service up (stop when external ip is present and go to this ip)

kubectl get services azure-vote-front --watch

# Go to external IP of front service