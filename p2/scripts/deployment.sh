#!/bin/bash

kubectl create configmap app-one-html --from-file ~/confs/app1/index.html
kubectl create configmap app-two-html --from-file ~/confs/app2/index.html
kubectl create configmap app-three-html --from-file ~/confs/app3/index.html

kubectl apply -f ~/confs/app1/app.yaml -f ~/confs/app1/service.yaml 
kubectl apply -f ~/confs/app2/app.yaml -f ~/confs/app2/service.yaml 
kubectl apply -f ~/confs/app3/app.yaml -f ~/confs/app3/service.yaml 

kubectl apply -f ~/confs/routing.yaml
