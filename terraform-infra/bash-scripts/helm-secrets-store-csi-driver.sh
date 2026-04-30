#!/bin/bash
exec > >(tee /var/log/userdata.log|logger -t userdata -s 2>/dev/console) 2>&1
set -euxo pipefail


helm install csi-secrets-store secrets-store-csi-driver/secrets-store-csi-driver --namespace kube-system