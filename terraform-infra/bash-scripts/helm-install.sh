#!/bin/bash
exec > >(tee /var/log/userdata.log|logger -t userdata -s 2>/dev/console) 2>&1
set -euxo pipefail


curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash