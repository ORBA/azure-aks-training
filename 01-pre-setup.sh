#!/usr/bin/env bash

# Set variables

export SUBSCRIPTION_ID=<YOUR_SUBSCRIPTION_ID>
export RG=<YOUR_RG>
export CLUSTER_NAME=aks${RANDOM}

# Login and setup default subscription

az login
az account set -s $SUBSCRIPTION_ID

# Ensure RG exists

az group create --name $RG --location northeurope