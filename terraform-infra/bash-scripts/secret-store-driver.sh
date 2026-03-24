#!/bin/bash

set -xe

echo "Waiting for Kubernetes API..."
until kubectl get nodes; do
  echo "Kubernetes not ready yet... retrying in 10 seconds"
  sleep 10
done

echo "Kubernetes is ready. Installing CSI Secrets Store driver..."

helm install csi-secrets-store secrets-store-csi-driver/secrets-store-csi-driver --namespace kube-system
kubectl apply -n kube-system \
  -f https://raw.githubusercontent.com/aws/secrets-store-csi-driver-provider-aws/main/deployment/aws-provider-installer.yaml
