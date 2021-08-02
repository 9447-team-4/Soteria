#!/bin/sh
cd ../
cd sonarqube/
helm dependency update
kubectl create namespace sonarqube
helm upgrade --install -f values.yaml -n sonarqube sonarqube ./
export POD_NAME=$(kubectl get pods --namespace sonarqube -l "app=sonarqube,release=sonarqube" -o jsonpath="{.items[0].metadata.name}")
kubectl wait --for=condition=ready --timeout 1000s pod -n sonarqube $POD_NAME
echo "Visit sonarqube here:"
minikube service --url sonarqube-sonarqube -n sonarqube
