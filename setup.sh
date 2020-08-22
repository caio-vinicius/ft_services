#!/bin/bash

progress_bar()
{
    echo -ne "($2) $1\r"
}

progress_bar ' ' '0%'
minikube start > /dev/null
progress_bar '#' '12%'
minikube addons enable metallb > /dev/null
progress_bar '##' '16%'
eval $(minikube docker-env)
progress_bar '###' '20%'
kubectl apply -f configmap_metallb.yaml > /dev/null
progress_bar '#####' '24%'
cd nginx && \
    docker build -t nginx:services . > /dev/null && kubectl apply -f nginx.yaml > /dev/null && cd ..
progress_bar '#######' '30%'
cd ftps && \
    docker build -t ftp:services . > /dev/null && kubectl apply -f ftp.yaml > /dev/null && cd ..
progress_bar '#########' '37%'
cd wordpress && \
    docker build -t wordpress:services . > /dev/null && kubectl apply -f wordpress.yaml > /dev/null && \
    cd mariadb && docker build -t mariadb:services . > /dev/null && kubectl apply -f mariadb.yaml > /dev/null && \
    cd .. && cd ..
progress_bar '############' '60%'
cd phpmyadmin && docker build -t phpmyadmin:services . > /dev/null && kubectl apply -f phpmyadmin.yaml > /dev/null && \
    cd ..
progress_bar '################' '82%'
cd grafana && docker build -t grafana:services . > /dev/null && kubectl apply -f grafana.yaml > /dev/null && \
    cd influxdb && docker build -t influxdb:services . > /dev/null && kubectl apply -f influxdb.yaml > /dev/null && \
    cd .. && cd telegraf && docker build -t telegraf:services . > /dev/null && \
    bash minikube_ip.sh && kubectl apply -f telegraf.yaml > /dev/null && \
    cd .. && cd ..
progress_bar '####################' '100%'
minikube dashboard &
