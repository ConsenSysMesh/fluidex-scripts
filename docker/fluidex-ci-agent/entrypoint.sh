#!/bin/bash

if [ -z "$KUBERNETES_SERVER" ]; then
    echo "Missing env variable KUBERNETES_SERVER"
    exit 1
fi

if [ -z "$KUBERNETES_TOKEN" ]; then
    echo "Missing env variable KUBERNETES_TOKEN"
    exit 1
fi

if [ -z "$KUBERNETES_CERT" ]; then
    echo "Missing env variable KUBERNETES_CERT"
    exit 1
fi

mkdir -p /root/.kube

KUBERNETES_CERT_PATH=/root/.kube/ca.crt
echo -e "$KUBERNETES_CERT" > "$KUBERNETES_CERT_PATH"

kubectl config set-cluster default --server=$KUBERNETES_SERVER --certificate-authority=$KUBERNETES_CERT_PATH
kubectl config set-context default --cluster=default
kubectl config set-credentials admin --token=$KUBERNETES_TOKEN
kubectl config set-context default --user=admin
kubectl config use-context default
