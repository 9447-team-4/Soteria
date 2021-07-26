# Setup

To utilize the full potential of DroneCI, install postgres, drone-server and drone-runner.

	- Postgress: DroneCI needs a database for it's backend persistence.
	- Drone-server: This is the service that authenticates the SCM and through the use of chared secrets communicates with the runners.
	- Drone-runners: These are what run the pipeline.

Make sure you have Gitea instance up and running.
	- Click on the Gitea Profile.
	- Go to Applications section.
	- Create a new OAuth2 Application.
		-> Give it a name, eg: Drone.
		-> The redirect URL should be same as the `DRONE_GITEA_SERVER`'s value inside droneCI/server/drone-server-secret.yaml file with '/login' at the end.
		# http://gitea-charts-http.gitea.svc.cluster.local:3000/user/login
	- Once you click Create Application, it will generate Client ID and Client Secret.
	- Copy the two and update these in the droneCI/server/drone-server-secret.yaml. Also for the `DRONE_GITEA_SERVER`, you should put the url that you obtain by running `minikube service --url gitea-charts-http -n gitea`.

## Deploying Postgres for Persistence
	-> kubectl create namespace drone
	-> kubectl -n drone2 apply -f postgres/postgres-deployment.yaml

This should create the required pod for postgres service.

## Deploying Drone-Server

You need to  
	-> kubectl -n drone apply -f server/drone-server-secret.yaml
	-> kubectl -n drone apply -f server/drone-server-service.yaml
	-> kubectl -n drone apply -f server/drone-server-deployment.yaml

All in one command:
`kubectl -n drone2 apply -f server/drone-server-secret.yaml ; kubectl -n drone2 apply -f server/drone-server-service.yaml ; kubectl -n drone2 apply -f server/drone-server-deployment.yaml` 

This will create the required pod for running Drone-server. To get the drone UI, run:
	-> kubectl -n drone port-forward ${drone_server_pod_name} ${your_desired_port}:80 -n ${namespace}

You should now be able to view the UI at http://localhost:${your_desired_port}

## Deploying Drone-Runner

	- kubectl -n drone apply -f runner/drone-runner-rbac.yaml ;kubectl -n drone apply -f runner/drone-runner-deployment.yaml
