#!/bin/bash

#
sudo apt-get update && \
sudo apt-get install -y apt-transport-https ca-certificates curl

#
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg && \
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update && \
sudo apt-get install -y kubelet=1.25.3-00 kubeadm=1.25.3-00 kubectl=1.25.3-00 && \
sudo apt-mark hold kubelet kubeadm kubectl

#Initializing kubernetes cluster creation
sudo kubeadm init

#Final commands, after that you will be able to use your cluster via kubectl
mkdir -p $HOME/.kube && \
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config && \
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#Installing CNI plugin
#Weave is selected as CNI
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml
