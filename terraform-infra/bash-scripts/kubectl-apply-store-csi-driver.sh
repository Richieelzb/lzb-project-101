#!/bin/bash

kubectl apply -n kube-system \
  -f https://raw.githubusercontent.com/aws/secrets-store-csi-driver-provider-aws/main/deployment/aws-provider-installer.yaml
