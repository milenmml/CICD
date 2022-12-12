#!/bin/bash

#This script will install jenkins on k8s 
#Cloning repository, git must be install before running this script
git clone https://github.com/scriptcamp/kubernetes-jenkins

#Entering in cloned repository
cd kubernetes-jenkins

#Creating namespace for jenkins
kubectl create namespace devops-tools

#Creating serivice account for Jenkins
kubectl apply -f serviceAccount.yaml

#Prompting for worker node name, on which volume will be installed and creating volume

echo "Please enter exact name of worker node on which this volueme will be created"
read WNODE

sudo sed -i 's/worker-node01/$WNODE/' volume.yaml

kubectl create -f volume.yaml


#Creating deployment
kubectl apply -f deployment.yaml

#Creating a service(NodePort) which will expose jenkins on port 32000
kubectl apply -f service.yaml
