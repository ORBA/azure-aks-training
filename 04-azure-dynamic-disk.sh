#!/usr/bin/env bash

# Apply objects

kubectl apply -f azure-dynamic-disk.yaml

# Describe pod (try until pod is Started)

kubectl describe pod mypod

#  Warning  FailedScheduling        36s (x4 over 59s)  default-scheduler                  pod has unbound immediate PersistentVolumeClaims
#  Normal   Scheduled               35s                default-scheduler                  Successfully assigned default/mypod to aks-nodepool1-XXXXXXX-0
#  Normal   SuccessfulAttachVolume  25s                attachdetach-controller            AttachVolume.Attach succeeded for volume "pvc-XXXXXXX"
#  Normal   Pulling                 9s                 kubelet, aks-nodepool1-XXXXXXXX-0  Pulling image "nginx:1.15.5"
#  Normal   Pulled                  5s                 kubelet, aks-nodepool1-XXXXXXXX-0  Successfully pulled image "nginx:1.15.5"
#  Normal   Created                 2s                 kubelet, aks-nodepool1-XXXXXXXX-0  Created container mypod
#  Normal   Started                 2s                 kubelet, aks-nodepool1-XXXXXXXX-0  Started container mypod
#           ^^^^^^^

# Show mount inside pod

kubectl exec mypod -- df -h /mnt/azure

# Get information about Volume Claim

kubectl describe pvc azure-managed-disk

# Describe Volume (use own UUID)

# kubectl describe pv pvc-XXXXXXXX-XXXXXXXX-XXXXXXXX-XXXXXXXX-XXXXXXXX