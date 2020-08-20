#!/bin/bash

color_message()
{
	echo -e "\033[$1m - $2\033[0m"
}

color_message 1 "Starting minikube..."
minikube start
color_message 1 "Activating metallb..."
minikube addons enable metallb
color_message 1 "Linking minikube docker..."
eval $(minikube docker-env)
color_message 1 "Configuring metalLB..."
kubectl apply -f configmap_metallb.yaml
color_message 1 "Install nginx..."
cd nginx && \
    docker build -t nginx:services . && kubectl apply -f nginx.yaml && cd ..
color_message 1 "Install ftps..."
cd ftp && \
    docker build -t ftp:services . && kubectl apply -f ftp.yaml && cd ..
color_message 1 "Install wordpress and mariadb..."
cd wordpress && \
    docker build -t wordpress:services . && kubectl apply -f wordpress.yaml && \
    cd mariadb && docker build -t mariadb:services . && kubectl apply -f mariadb.yaml && \
    cd .. && cd ..
color_message 1 "Install phpmyadmin..."
cd phpmyadmin && docker build -t phpmyadmin:services . && kubectl apply -f phpmyadmin.yaml && \
    cd ..
color_message 1 "Install grafana, influxdb and telegraf..."
cd grafana && docker build -t grafana:services . && kubectl apply -f grafana.yaml && \
    cd influxdb && docker build -t influxdb:services . && kubectl apply -f influxdb.yaml && \
    cd .. && cd telegraf && docker build -t telegraf:services . && kubectl apply -f telegraf.yaml && \
    cd .. && cd ..
color_message 1 "Opening minikube dashboard..."
minikube dashboard &
