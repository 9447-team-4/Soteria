# ArgoCD Manifests

ArgoCD manifests for the pipeline

create namespace 'argocd' in minikube
`kubectl create namespace argocd`

Run the following command to install ArgoCD
`kubectl apply -n argocd -f ./infrastructure/argocd/argo-cd/install.yaml`

(Can check the status by running `kubectl -n argocd get pods`)

controller looks after all the app yamls we passed in.

Run the following command to fast forward to localhost
`kubectl port-forward svc/argocd-server -n argocd 8080:443`

Run the following command to obtain the initial admin password for ArgoCD.
(When logging into the ArgoCD server, the initial id is set to `'admin'`)

`kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo`

Run the following command to deploy application
e.g. `kubectl apply -n argocd -f ./infrastructure/argocd/argo-cd/app.yaml`


OPTIONAL

Patching the argocd-server to LoadBalancer
`kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'`

Patching the argocd-server to NodePort
`kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'`


