#!/bin/bash

minikube start
minikube addons enable metallb
eval $(minikube docker-env)
kubectl apply -f configmap_metallb.yaml
cd nginx && \
    docker build -t nginx:services . && kubectl apply -f nginx.yaml && cd ..
cd ftp && \
    docker build -t ftp:services . && kubectl apply -f ftp.yaml && cd ..
cd wordpress && \
    docker build -t wordpress:services . && kubectl apply -f wordpress.yaml && \
    cd mariadb && docker build -t mariadb:services . && kubectl apply -f mariadb.yaml && cd ..
cd phpmyadmin && docker build -t phpmyadmin:services . && kubectl apply -f phpmyadmin.yaml && \
    cd .. && cd ..
cd grafana && docker build -t grafana:services . && kubectl apply -f grafana.yaml && \
    cd influxdb && docker build -t influxdb:services . && kubectl apply -f influxdb.yaml && cd .. && \
    cd telegraf && docker build -t telegraf:services . && kubectl apply -f telegraf.yaml && \
    cd .. && cd ..
minikube dashboard
