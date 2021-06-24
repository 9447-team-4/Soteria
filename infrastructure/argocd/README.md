# ArgoCD Manifests

ArgoCD manifests for the pipeline

Run 
`kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo` for the initial admin password.