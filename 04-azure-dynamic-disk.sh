#!/usr/bin/env bash

kubectl apply -f azure-dynamic-disk.yaml

# Describe pod (try until pod is Started)

# Warning  FailedScheduling        10m (x4 over 10m)  default-scheduler                  pod has unbound immediate PersistentVolumeClaims
# Normal   Scheduled               10m                default-scheduler                  Successfully assigned default/mypod to aks-nodepool1-XXXXXXXX-0
# Normal   SuccessfulAttachVolume  10m                attachdetach-controller            AttachVolume.Attach succeeded for volume "pvc-XXXXXXXX"
# Normal   Pulling                 10m                kubelet, aks-nodepool1-XXXXXXXX-0  Pulling image "nginx:1.15.5"
# Normal   Pulled                  10m                kubelet, aks-nodepool1-XXXXXXXX-0  Successfully pulled image "nginx:1.15.5"
# Normal   Created                 9m59s              kubelet, aks-nodepool1-XXXXXXXX-0  Created container mypod
# Normal   Started                 9m59s              kubelet, aks-nodepool1-XXXXXXXX-0  Started container mypod
#          ^^^^^^^

kubectl describe pod mypod

# Show mount inside pod

kubectl exec mypod -- df -h /mnt/azure

# Get information about Volume Claim

kubectl describe pvc azure-managed-disk
