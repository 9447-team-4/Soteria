#!/bin/bash

ARGOCD_SERVER=localhost:8080 argocd --grpc-web app sync test --force
argocd app wait test
echo -e "Successfully synced"
