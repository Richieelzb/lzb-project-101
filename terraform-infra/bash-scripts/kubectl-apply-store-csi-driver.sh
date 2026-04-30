#!/bin/bash
exec > >(tee /var/log/userdata.log|logger -t userdata -s 2>/dev/console) 2>&1
set -euxo pipefail


kubectl apply -n kube-system \
  -f https://raw.githubusercontent.com/aws/secrets-store-csi-driver-provider-aws/main/deployment/aws-provider-installer.yaml
