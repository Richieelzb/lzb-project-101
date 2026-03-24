#!/bin/bash
set -xe

# Run each script in order
/bin/bash /var/lib/cloud/scripts/per-instance/docker-install.sh
/bin/bash /var/lib/cloud/scripts/per-instance/kubectl-install.sh
/bin/bash /var/lib/cloud/scripts/per-instance/helm-install.sh
/bin/bash /var/lib/cloud/scripts/per-instance/secret-store-driver.sh

#helm install secrets-provider-aws aws-secrets-manager/secrets-store-csi-driver-provider-aws --namespace kube-system