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
		-> The redirect URL should be similar to the host url specified in the droneCI/server/drone-server-secret.yaml file with '/login' at the end.
	- Once you click Create Application, it will generate Client ID and Client Secret.
	- Copy the two and update these in the droneCI/server/drone-server-secret.yaml.

## Deploying Postgres for Persistence
	-> kubectl create namespace drone
	-> kubectl -n drone apply -f postgres/postgres-deployment.yaml

This should create the required pod for postgres service.

## Deploying Drone-Server

You need to  
	-> kubectl -n drone apply -f server/drone-server-secret.yaml
	-> kubectl -n drone apply -f server/drone-server-service.yaml
	-> kubectl -n drone apply -f server/drone-server-deployment.yaml

kubectl -n drone2 apply -f server/drone-server-secret.yaml ; kubectl -n drone2 apply -f server/drone-server-service.yaml ; kubectl -n drone2 apply -f server/drone-server-deployment.yaml ; 

This will create the required pod for running Drone-server. To get the drone UI, run:
	-> kubectl -n drone port-forward ${drone_server_pod_name} ${your_desired_port}:80


kubectl -n drone2 port-forward drone-server-deployment-54f77f646-hg6ct 5000:80



You should now be able to view the UI at http://localhost:${your_desired_port}

## Deploying Drone-Runner

	- kubectl -n drone2 apply -f runner/drone-runner-rbac.yaml ;kubectl -n drone2 apply -f runner/drone-runner-deployment.yaml




