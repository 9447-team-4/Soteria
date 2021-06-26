# SonarQube

To install the Helm Chart from the GitHub Repository, you can use the following commands:
```
git clone git@github.com:9447-team-4/SonarQube.git
cd SonarQube
helm dependency update
kubectl create namespace sonarqube
helm upgrade --install -f values.yaml -n sonarqube sonarqube ./
```
After pods are running:
```
export POD_NAME=$(kubectl get pods --namespace sonarqube -l "app=sonarqube,release=sonarqube" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward $POD_NAME 8080:9000 -n sonarqube
```
Naviagte to http://127.0.0.1:8080/

Use the default login:

User:admin

Password:admin

Change password to "password" (Just to test).

# SonarScan

Navigate to desired folder to scan.

```
wget https://raw.githubusercontent.com/9447-team-4/SonarQube/main/sonar-project.properties?token=ALKX2SWFO3MC33LTS4TWW3TA23FFG
docker run --rm -v $(pwd):/usr/src --network=host sonarsource/sonar-scanner-cli

```
Naviagte to http://127.0.0.1:8080/ to view results.
