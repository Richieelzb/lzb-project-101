#!/bin/bash
set -xe

echo "Installing Helm 3..."

# Install Helm
curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Ensure PATH is updated for all sessions
echo 'export PATH=/usr/local/bin:$PATH' >> /etc/profile
export PATH=/usr/local/bin:$PATH

echo "Adding Helm repositories..."

# Add CSI Drivers repos
helm repo add secrets-store-csi-driver https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts
helm repo add aws-secrets-manager https://aws.github.io/secrets-store-csi-driver-provider-aws

# Update repos
helm repo update

echo "Helm installation complete."