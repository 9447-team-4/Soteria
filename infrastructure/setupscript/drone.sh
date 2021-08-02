#! /usr/bin/env bash

# Install Telepresence
echo "Installing Telepresence"
sudo curl -fL https://app.getambassador.io/download/tel2/linux/amd64/latest/telepresence -o /usr/local/bin/telepresence
sudo chmod a+x /usr/local/bin/telepresence
telepresence connect
telepresence connect # CHECK LATER
MINIKUBE_IP=$(minikube ip)
cd ../
cd telepresence/droneCI/server/
sed -i 's|{{MINIKUBE_IP}}|$MINIKUBE_IP|' drone-server-secret.yaml
echo "Enter your Gitea token"
read GITEA_SECRET
echo "Enter your Gitea OAuth token"
read GITEA_OAUTH
# sed -i 's|{{GITEA_SECRET}}|$GITEA_SECRET|g' drone-server-secret.yaml
# sed -i 's|{{GITEA_OAUTH}}|$GITEA_OAUTH|g' drone-server-secret.yaml
sed -i '' 's|{{GITEA_SECRET}}|$GITEA_SECRET|g' drone-server-secret.yaml # MACOS
sed -i '' 's|{{GITEA_OAUTH}}|$GITEA_OAUTH|g' drone-server-secret.yaml # MACOS
cd ..
kubectl create namespace drone
kubectl -n drone apply -f postgres/
export POD_NAME=$(kubectl get pods --namespace drone -l "app=postgres" -o jsonpath="{.items[0].metadata.name}")
kubectl wait --for=condition=ready --timeout 60s pod -n drone $POD_NAME
kubectl -n drone apply -f server/
export POD_NAME=$(kubectl get pods --namespace drone -l "app=drone-server-deployment" -o jsonpath="{.items[0].metadata.name}")
kubectl wait --for=condition=ready --timeout 60s pod -n drone $POD_NAME
kubectl apply -f gitea-reporter/gitea-reporter-configmap.yaml -n drone
echo "Secret tokens and environment variables need to be setup later"
kubectl -n drone apply -f runner/
export POD_NAME=$(kubectl get pods --namespace drone -l "app.kubernetes.io/name=drone" -o jsonpath="{.items[0].metadata.name}")
kubectl wait --for=condition=ready --timeout 60s pod -n drone $POD_NAME
echo "Drone setup complete :)"
echo "Drone server ip:"
minikube service --url droneserver -n drone
