#!/usr/bin/env bash

# Delete group and APP

az group delete --name $RG --yes --no-wait

#az ad sp delete --id $(az aks show -g $RG -n $CLUSTER_NAME --query servicePrincipalProfile.clientId -o tsv)
az ad app delete --id $(az ad app list --display-name $CLUSTER_NAME --query '[].appId' -o tsv)

# Remove cluster configs from local kube config
kubectl config delete-context $CLUSTER_NAME
kubectl config delete-cluster $CLUSTER_NAME

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# Remove credatials from ~/.azure/aksServicePrincipal.json
# https://docs.microsoft.com/en-us/azure/aks/kubernetes-service-principal#additional-considerations
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

rm ~/.azure/aksServicePrincipal.json