Assuming that you are in a testing k8s cluster in the cloud with multiple namespaces and services.

First we need to know the kube-dns IP address with the following command
`kubectl -n kube-system get svc | grep kube-dns | awk '{print $3}'`

start minikube
`minikube start --vm-driver=hyperkit`

`kubectl patch svc servicename -n namespacename -p '{"spec": {"type": "NodePort"}}'`

`minikube dashboard`