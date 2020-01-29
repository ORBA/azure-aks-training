#!/usr/bin/env bash

# Deploy objects

kubectl apply -f azure-dynamic-files.yaml

# Describe pod (try until pod is Started)

kubectl describe pod mypod2

# Type     Reason            Age                From                               Message
# ----     ------            ----               ----                               -------
# Warning  FailedScheduling  10s (x3 over 33s)  default-scheduler                  pod has unbound immediate PersistentVolumeClaims
# Normal   Scheduled         9s                 default-scheduler                  Successfully assigned default/mypod2 to aks-nodepool1-XXXXXXXX-0
# Normal   Pulling           7s                 kubelet, aks-nodepool1-XXXXXXXX-0  Pulling image "nginx"
# Normal   Pulled            3s                 kubelet, aks-nodepool1-XXXXXXXX-0  Successfully pulled image "nginx"
# Normal   Created           2s                 kubelet, aks-nodepool1-XXXXXXXX-0  Created container mypod2
# Normal   Started           2s                 kubelet, aks-nodepool1-XXXXXXXX-0  Started container mypod
#          ^^^^^^^
# List files on mount point (should be empty)

kubectl exec mypod2 -- ls -l /mnt/azure

# Create file

kubectl exec mypod2 -- touch /mnt/azure/test.txt

# List files in two different pods

kubectl exec mypod2 -- ls -l /mnt/azure
kubectl exec mypod3 -- ls -l /mnt/azure

# File should be present in both


