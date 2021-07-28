# Setup

To utilize the full potential of DroneCI, install postgres, drone-server and drone-runner.

	- Postgress: DroneCI needs a database for it's backend persistence.
	- Drone-server: This is the service that authenticates the SCM and through the use of chared secrets communicates with the runners.
	- Drone-runners: These are what run the pipeline.

Make sure you have Gitea instance up and running. 
Also before you proceed, download ngrok to expose your localhost port to a public IP. Run the command

	- ./ngrok http 3000 (For Gitea)
	- ./ngrok http 5000 (For Drone)
	- After starting the two ngrok urls, modify droneCI/server/drone-server-secret.yaml.
		-> Inside the file, change the GITEA_SERVER_HOST to the http ngrok url generated about for gitea.
		-> Change the DRONE_SERVER_HOST to the http ngrok url generated for drone but without the http.

You will have 2 hours after which the two servers will timeout. You will need to rerun the two commands above, get the new urls and update deployment again.

Steps to setup Gitea  
	
	- Click on the Gitea Profile.
	- Go to Applications section.
	- Create a new OAuth2 Application.
		-> Give it a name, eg: Drone.
		-> For redirect url: http://{ngrok_drone_url}/login
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

This will create the required pod for running Drone-server. To get the drone UI, run:
	-> kubectl -n drone port-forward ${drone_server_pod_name} 5000:80

## Deploying Drone-Runner

	- kubectl -n drone apply -f runner/drone-runner-rbac.yaml
	- kubectl -n drone apply -f runner/drone-runner-deployment.yaml

## Drone UI

	- Get the UI frome ${ngrok_drone_url}


-> On the welcome page click continue.

-> On the next page, enter the gitea_admin username and its password.

-> After the authorization, Drone will show the register page. From the url above, remove the register endpoint.

-> Hit Enter and it should take you to the Home page which will show any repos if you have in your gitea instance.
  - You can click the sync button if you add a repo afterwards.

-> Click the repo link and then "Activate Repository".

-> To run a pipeline, there needs to be a config file in the root of your gitea repo which drone will use.
  - For demo, copy the file in the droneCI folder called drone.yml into your local gitea branch and push it to gitea repo.

-> Now go under settings, and in the Configuration section, add 'drone.yml' and click save.

Now whenever you push any change, it should run the steps specified in the drone.yml file.



