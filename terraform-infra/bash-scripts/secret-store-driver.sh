#! /bin/bash

helm install csi-secrets-store secrets-store-csi-driver/secrets-store-csi-driver --namespace kube-system
