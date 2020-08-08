#!/bin/bash

minikube start
minikube addons enabled metallb
eval $(minikube docker-env)
kubectl apply -f configmap_metallb.yaml
kubectl apply -f nginx.yaml
