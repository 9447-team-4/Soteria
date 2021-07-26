`minikube start --vm-driver=hyperkit`

<!-- kubectl expose deployment drone-server-deployment --port=80 --target-port=8080 -->

Redirect URI `http://drone.soteria.com/login`


kubectl get deployment -n drone

brew install datawire/blackbird/telepresence

kubectl expose deploy drone-server-deployment --port 80 --target-port 5000 -n drone
kubectl get service drone-server-deployment -n drone

kubectl get deployments -n drone
<!-- kubectl expose deployment drone-server-deployment  --type=LoadBalancer --port=5000 -n drone -->

<!-- kubectl patch svc drone-server-deployment -p '{"spec": {"type": "NodePort"}}' -n drone -->
kubectl patch svc gitea-charts-http  -p '{"spec": {"type": "NodePort"}}' -n gitea 
kubectl get service droneserver -n drone

<!-- minikube service --url drone-server-deployment -n drone -->
minikube service --url droneserver -n drone

kubectl -n drone port-forward drone-server-deployment-54f77f646-k5v59 5000:80

minikube service --url gitea-charts-http  -n gitea

kubectl get ns,svc,deploy,po -n gitea