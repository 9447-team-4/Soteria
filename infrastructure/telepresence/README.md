# Using Telepresence

If you are testing with minikube,

<!-- `minikube start --vm-driver=hyperkit` -->
`minikube start --memory=4400mb --vm-driver=hyperkit`

Install Telepresence first. The way differ by your OS but if you are a mac user, simply `brew install datawire/blackbird/telepresence`.

Prerequisite: Make sure you have DroneCI, Gitea instance up and running.

By running `kubectl get ns,svc,deploy,po` check the name of your deployments and services (check service names for gitea and drone. They MUST be NodePort.)

Check telepresence version `telepresence version`

# Establish a connection to the cluster (outbound traffic)
Let telepresence connect:
`telepresence connect`
A session is now active and outbound connections will be routed to the cluster. I.e. your laptop is "inside" the cluster.

`minikube service --url droneserver -n drone`
`minikube service --url gitea-charts-http -n gitea`