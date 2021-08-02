#! /usr/bin/env bash
#     GITEA_TOKEN={{GITEA_TOKEN}}
#     GITEA_USERNAME={{GITEA_USERNAME}}
#     GITEA_HOST={{GITEA_HOST}}
#     GITEA_PORT={{GITEA_PORT}}
#     GITEA_REPO={{GITEA_REPO}}
#     SONAR_URL={{SONAR_URL}}
#     SONAR_LOGIN={{SONAR_USER}}
#     SONAR_PASSWORD={{SONAR_PASSWORD}}
#     SONAR_KEY={{GITEA_USERNAME}}:{{GITEA_REPO}}

cd ../
cd telepresence/droneCI/
echo "Setting up drone config map"
# echo "Enter your gitea token:"
# read GITEA_TOKEN
echo "Enter your gitea username:"
read GITEA_USERNAME
echo "Enter where the gitea server is hosted:"
read GITEA_HOST
echo "Enter where the gitea server port:"
read GITEA_PORT
echo "Enter gitea repo name:"
read GITEA_REPO
echo "Enter where the sonarqube server is hosted:"
read SONAR_URL
echo "Enter your sonarqube username or token:"
echo "Token can be generated from the page: SonarQube->My Account->Security->Generate Tokens"
read SONAR_USER
echo "Enter your sonarqube password or leave blank if using token:"
# read -s SONAR_PASSWORD
stty -echo
read SONAR_PASSWORD;
stty echo
echo "Enter sonarqube project key:"
read SONAR_KEY
echo $SONAR_PASSWORD
# kubectl get cm -n drone gitea-reporter-configmap -o yaml | sed "s|{{SONAR_URL}}|$SONAR_URL|" | sed "s|{{SONAR_USER}}|$SONAR_USER|" | sed "s|{{SONAR_PASSWORD}}|$SONAR_PASSWORD|" | sed "s|{{SONAR_KEY}}|$SONAR_KEY|" | kubectl apply -f -
kubectl get cm -n drone gitea-reporter-configmap -o yaml | sed "s|{{GITEA_TOKEN}}|$GITEA_TOKEN|" | kubectl apply -f -
kubectl get cm -n drone gitea-reporter-configmap -o yaml | sed "s|{{GITEA_USERNAME}}|$GITEA_USERNAMEUSERNAME|" | kubectl apply -f -
kubectl get cm -n drone gitea-reporter-configmap -o yaml | sed "s|{{GITEA_HOST}}|$GITEA_HOST|" | kubectl apply -f -
kubectl get cm -n drone gitea-reporter-configmap -o yaml | sed "s|{{GITEA_PORT}}|$GITEA_PORT|" | kubectl apply -f -
kubectl get cm -n drone gitea-reporter-configmap -o yaml | sed "s|{{GITEA_REPO}}|$GITEA_REPO|" | kubectl apply -f -
kubectl get cm -n drone gitea-reporter-configmap -o yaml | sed "s|{{SONAR_URL}}|$SONAR_URL|" | kubectl apply -f -
kubectl get cm -n drone gitea-reporter-configmap -o yaml | sed "s|{{SONAR_USER}}|$SONAR_USER|" | kubectl apply -f -
kubectl get cm -n drone gitea-reporter-configmap -o yaml | sed "s|{{SONAR_PASSWORD}}|$SONAR_PASSWORD|" | kubectl apply -f -
kubectl get cm -n drone gitea-reporter-configmap -o yaml | sed "s|{{SONAR_KEY}}|$SONAR_KEY|" | kubectl apply -f -
