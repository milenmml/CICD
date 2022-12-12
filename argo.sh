#!/bin/bash

#Installation of argoCD in kubernetes cluster which is already configured
#This script will deploy argoCD which will be able to deploy aplications only in the samo k8s cluster


kubectl create ns argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

#ArgoCD is still not exposed and web UI is not accessible

#Exposing ArgoCD, by changing the argocd-server service type to LoadBalancer

kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'


#After that ArgoCD application is exposed trought NodePort, which can by checked by running command^?

echo "Ports on which ArgoCD application is exposed you ca see on row below:"
echo
kubectl get svc argocd-server -n argocd -o jsonpath='{.spec.ports[*].nodePort}'
echo
echo
echo
echo Application will be exposed in following format - IPaddress of node on which application is deployed and port on which is exposed
echo Format in which you can reach web UI of application - " IPofNode:NodePord"
echo
echo


