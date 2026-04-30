#!/bin/bash
exec > >(tee /var/log/userdata.log|logger -t userdata -s 2>/dev/console) 2>&1
set -euxo pipefail


helm repo add aws-secrets-manager https://aws.github.io/secrets-store-csi-driver-provider-aws
helm repo update