#!/bin/bash

#
sudo apt-get update && \
sudo apt-get install -y apt-transport-https ca-certificates curl

#
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg && \
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update && \
sudo apt-get install -y kubelet kubeadm kubectl && \
sudo apt-mark hold kubelet kubeadm kubectl


echo "All kubernetes components are installed, now execute on Master node following command 'kubeadm token create --print-join-command'"
echo
echo "After that, command for joining to k8s cluster will be displayed"
echo
echo "Please execute mentioned command in order to join to cluster"
