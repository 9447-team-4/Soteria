# Gitea

Gitea is cool

## Installation

### kubernetes
First install helm by:

```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```
Then, navigate to the helm-chart folder and run:
```
helm dependency update 
```
Finally, navigate to the root gitea folder and run:
```
helm install gitea-charts helm-chart/ --values helm-chart/values.yaml
```
This will add 3 pods to your default kubernetes namespace.

## Usage
To open a UI to the gitea server run:
```
kubectl port-forward gitea-charts-0 3000:3000
```
The ui is accesible from any browser at localhost:3000  
The default admin account is:
```
  admin:
    username: admin
    password: pass
    email: "gitea@local.domain"

```
