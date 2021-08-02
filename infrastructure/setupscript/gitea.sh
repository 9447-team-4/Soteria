#! /usr/bin/env bash

cd ..
cd infrastructure/gitea/helm-chart/
helm dependency update
kubectl create namespace gitea
kubectl create quota test --hard=count/persistentvolumeclaims=4 --namespace=gitea
cd ..
helm install gitea-charts helm-chart/ --values helm-chart/values.yaml --namespace gitea
kubectl wait --for=condition=ready --timeout 600s pod -n gitea gitea-charts-0
echo "Visit gitea here:"
minikube service --url gitea-charts-http -n gitea
