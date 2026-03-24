#!/bin/bash
set -xe

yum install -y curl tar gzip

until curl -sf https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 >/dev/null; do
  echo "Waiting for network..."
  sleep 10
done

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
export PATH=/usr/local/bin:$PATH

helm repo add secrets-store-csi-driver https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts
helm repo add aws-secrets-manager https://aws.github.io/secrets-store-csi-driver-provider-aws
helm repo update