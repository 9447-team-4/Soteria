# Soteria

An out of the box development environment including a git server, CI/CD pipeline and project tracker. 

The Soteria name dreives from the Greek god of safety and salvation, deliverance, and preservation from harm.

## Design

OpenVPN -> Gitea Server -> Argo Workflows -> Image Registry -> ArgoCD -> Dev Cluster -> Prod Cluster

### Git Server: Gitea

Soteria uses Gitea for the git server hosting all of your code and triggering the CI/CD pipelines.
Custom git hooks are also deployed to prevent access keys and passwords from being pushed.


### CI: Argo Workflows

Soteria uses Argo Workflows to run the CI pipelines which include a range of static analysis tools to prevent vulnerabilities and bad code from being merged.

Tools:
- SonarQube: 
- SuperLinter: 
- Snyk: Docker image CVE detection

https://github.com/github/super-linter

### Image Registry

Soteria CI pipelines build docker images which are pushed to an image registry outside of the kubernetes cluster.

### CD: ArgoCD

Soteria deploys ArgoCD which deploys and updates the pipeline for the testing, dev and production clusters.
ArgoCD also runs automated dynamic testing including API fuzzers then returns results to Gitea.

### Dev Cluster

The dev cluster is where the development stack is run and updated by ArgoCD

### Prod Cluster

The prod cluster is where the development stack is run and updated by ArgoCD
