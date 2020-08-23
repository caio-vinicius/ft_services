#!/bin/bash

export MINIKUBE_IP=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)
sed -i '20s|url = ""|url = "https://'$MINIKUBE_IP':10250"|g' ./telegraf.yaml
