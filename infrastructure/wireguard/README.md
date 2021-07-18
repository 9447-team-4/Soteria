Assuming that you are in a testing k8s cluster in the cloud with multiple namespaces and services.

First we need to know the kube-dns IP address with the following command
`kubectl -n kube-system get svc | grep kube-dns | awk '{print $3}'`

start minikube
`minikube start --vm-driver=hyperkit`

<!-- `kubectl patch svc servicename -n namespacename -p '{"spec": {"type": "NodePort"}}'` -->

<!-- `minikube dashboard` -->
tcpdump

`wg genkey | tee privatekey | wg pubkey > publickey`

`umask 077`
`wg genkey | tee server_private_key | wg pubkey > server_public_key`
`cat server_public_key`

`wg genkey | tee client_private_key | wg pubkey > client_public_key`
`cat client_public_key`



[Interface]
Address = 10.100.100.1/24
SaveConfig = true
PrivateKey = 
ListenPort = 51820
PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE

[Peer]
PublicKey = 
AllowedIPs = 10.100.100.2/32


sudo wg set wg0 peer QtDrRcACmJ2pTLR8cKcXoL064Bpusw8s7+3D1fW/TUw= allowed-ips 10.0.0.3