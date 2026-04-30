#!/bin/bash
exec > >(tee /var/log/userdata.log|logger -t userdata -s 2>/dev/console) 2>&1
set -euxo pipefail

helm repo add secrets-store-csi-driver https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts