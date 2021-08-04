#! /usr/bin/env bash

echo "Starting setup, make sure minikube is running"
chmod +x gitea.sh
./gitea.sh
chmod +x sonarqube.sh
./sonarqube.sh
chmod +x sonarqube.sh
./sonarqube.sh
chmod +x drone.sh
./drone.sh
chmod +x dronecm.sh
./dronecm.sh
echo "Completed setup :D"
