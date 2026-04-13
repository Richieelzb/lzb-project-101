#!/bin/bash

helm install csi-secrets-store secrets-store-csi-driver/secrets-store-csi-driver --namespace kube-system
kubectl apply -n kube-system \
  -f https://raw.githubusercontent.com/aws/secrets-store-csi-driver-provider-aws/main/deployment/aws-provider-installer.yaml
