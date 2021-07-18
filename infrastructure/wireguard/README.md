Assuming that you are in a testing k8s cluster in the cloud with multiple namespaces and services.

First we need to know the kube-dns IP address with the following command
`kubectl -n kube-system get svc | grep kube-dns | awk '{print $3}'`

start minikube
`minikube start --vm-driver=hyperkit`

<!-- `kubectl patch svc servicename -n namespacename -p '{"spec": {"type": "NodePort"}}'` -->

<!-- `minikube dashboard` -->

`wg genkey | tee privatekey | wg pubkey > publickey`

`umask 077`
`wg genkey | tee server_private_key | wg pubkey > server_public_key`
`cat server_public_key`