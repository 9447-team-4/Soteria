# Exposing kubernetes cluster over vpn
Lets your pods have access to the network over VPN

1. Setup a VPN inside the Kubernetes cluster
2. Then expose that VPN via NodePort


start minikube
`minikube start --vm-driver=hyperkit`

create namespace 'openvpn' in minikube
`kubectl create namespace openvpn`


`helm install --generate-name ./open-vpn-connect-chart  --namespace openvpn`
NAME: open-vpn-connect-chart-1626594256
LAST DEPLOYED: Sun Jul 18 17:44:17 2021
NAMESPACE: openvpn
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
OpenVPN Connection is now set up!



minikube dashboard