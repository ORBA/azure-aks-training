#!/usr/bin/env bash


# Deploy sample APP

kubectl apply -f azure-vote.yaml

# Wait for service (retry until EXTERNAL-IP is present)

kubectl get services azure-vote-front

# Go to EXTERNAL-IP