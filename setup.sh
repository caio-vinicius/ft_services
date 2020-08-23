#!/bin/bash

message()
{
    echo -ne "$1\r"
}

cd srcs
message "Starting minikube..."
minikube start --vm-driver='docker' > /dev/null
sleep 3
message "Install metallb...\e[K"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml > /dev/null
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml > /dev/null
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" > /dev/null
sleep 3
message "Setup metallb configuration...\e[K"
kubectl apply -f metallb.yaml > /dev/null
sleep 3
message "Linking minikube with local docker...\e[K"
eval $(minikube docker-env)
sleep 3

message "Building nginx image...\e[K"
cd nginx && docker build -t nginx:services . > /dev/null && cd ..
sleep 3
message "Building ftps image...\e[K"
cd ftps && docker build -t ftp:services . > /dev/null && cd ..
sleep 3
message "Building wordpress and mariadb images...\e[K"
cd wordpress && docker build -t wordpress:services . > /dev/null && \
    cd mariadb && docker build -t mariadb:services . > /dev/null && cd .. && cd ..
sleep 3
message "Building phpmyadmin image...\e[K"
cd phpmyadmin && docker build -t phpmyadmin:services . > /dev/null && cd ..
sleep 3
message "Building grafana, influxdb and telegraf images...\e[K"
cd grafana && docker build -t grafana:services . > /dev/null && \
    cd influxdb && docker build -t influxdb:services . > /dev/null && cd .. && \
    cd telegraf && docker build -t telegraf:services . > /dev/null && ./minikube_ip.sh && cd .. && cd ..
sleep 3

message "Applying images to Kubernetes...\e[K"
kubectl apply -f nginx/nginx.yaml > /dev/null && \
sleep 3
kubectl apply -f ftps/ftp.yaml > /dev/null && \
sleep 3
kubectl apply -f wordpress/wordpress.yaml > /dev/null && \
    kubectl apply -f wordpress/mariadb/mariadb.yaml > /dev/null && \
sleep 3
kubectl apply -f phpmyadmin/phpmyadmin.yaml > /dev/null
sleep 3
kubectl apply -f grafana/grafana.yaml > /dev/null && \
    kubectl apply -f grafana/influxdb/influxdb.yaml > /dev/null && \
    kubectl apply -f grafana/telegraf/telegraf.yaml > /dev/null

cd ..
sleep 3

message "Opening Kubernetes dashboard...\e[K"
minikube dashboard &
