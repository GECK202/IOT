#!/bin/bash
#mv /tmp/deployment.yaml ~/
#mv /tmp/app1 ~/
#mv /tmp/app2 ~/
#mv /tmp/app3 ~/

kubectl create configmap app-one-html --from-file ~/app1/index.html
kubectl create configmap app-two-html --from-file ~/app2/index.html
kubectl create configmap app-three-html --from-file ~/app3/index.html

kubectl apply -f ~/deployment.yaml
