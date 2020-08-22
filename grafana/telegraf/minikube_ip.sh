#!/bin/bash

export MINIKUBE_IP=$(minikube ip)
sed -i '20s|.*url =.*|      url = "https://'$MINIKUBE_IP':10250"|g' ./telegraf.yaml
