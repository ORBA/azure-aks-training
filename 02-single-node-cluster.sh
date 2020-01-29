#!/usr/bin/env bash

# Create cluster (it can take a time)

# IMPORTANT: In case of error: 'The credentials in ServicePrincipalProfile were invalid'
# just repeat action (AD propagation may stuck)

az aks create --resource-group $RG --name $CLUSTER_NAME --node-count 1 --generate-ssh-keys

# OPTIONAL: Install kubelet

az aks install-cli

# Fetch cluster credentailas and set current context

az aks get-credentials --resource-group $RG --name $CLUSTER_NAME

# Set RBAC

kubectl create clusterrolebinding kubernetes-dashboard -n kube-system --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard

# List nodes

kubectl get nodes

# Browse Panel

az aks browse --resource-group $RG --name $CLUSTER_NAME