#!/bin/bash

message()
{
    echo -ne "$1\r"
}

message "Starting minikube..."
minikube start > /dev/null
message "Install metallb...\e[K"
minikube addons enable metallb > /dev/null
message "Setup metallb configuration...\e[K"
kubectl apply -f metallb.yaml > /dev/null
message "Linking minikube with local docker...\e[K"
eval $(minikube docker-env)

message "Building nginx image...\e[K"
cd nginx && docker build -t nginx:services . > /dev/null && cd ..
message "Building ftps image...\e[K"
cd ftps && docker build -t ftp:services . > /dev/null && cd ..
message "Building wordpress and mariadb images...\e[K"
cd wordpress && docker build -t wordpress:services . > /dev/null && \
    cd mariadb && docker build -t mariadb:services . > /dev/null && cd .. && cd ..
message "Building phpmyadmin image...\e[K"
cd phpmyadmin && docker build -t phpmyadmin:services . > /dev/null && cd ..
message "Building grafana, influxdb and telegraf images...\e[K"
cd grafana && docker build -t grafana:services . > /dev/null && \
    cd influxdb && docker build -t influxdb:services . > /dev/null && cd .. && \
    cd telegraf && docker build -t telegraf:services . > /dev/null && ./minikube_ip.sh && cd .. && cd ..

message "Applying images to Kubernetes...\e[K"
kubectl apply -f nginx/nginx.yaml > /dev/null && \
kubectl apply -f ftps/ftp.yaml > /dev/null && \
kubectl apply -f wordpress/wordpress.yaml > /dev/null && \
    kubectl apply -f wordpress/mariadb/mariadb.yaml > /dev/null && \
kubectl apply -f phpmyadmin/phpmyadmin.yaml > /dev/null && \
    kubectl apply -f grafana/grafana.yaml > /dev/null && \
    kubectl apply -f grafana/influxdb/influxdb.yaml > /dev/null && \
    kubectl apply -f grafana/telegraf/telegraf.yaml > /dev/null

message "Opening Kubernetes dashboard...\e[K"
minikube dashboard &
