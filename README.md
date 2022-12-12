# CICD


Project documentation

This project will provision kubernetes cluster on cloud enviorment
Project keypoints:
We will provision k8s cluster with containerd as contariner runtime and we will install crictl as command-line interface for container runtime
Tool which is used for cluster provisioning is kubeadm
Cluster have 1 master node and 1 worker node
Infrastructure for performing entire CI/CD process, including GitOps(Jenkins and ArgoCD) will be deployed in k8s cluster and later entire process will be developed and process will be implemented and described.


This lab project include mentioned below shell scripts for provisioning our infrastructure:

containerd.sh will install:
-git
-container runtime – containerd, which will be prepaired for later as container runtime for our k8s cluster
-crictl - command-line interface for container runtime

k8sMaster.sh:
-Will install provision k8s master node trought kubeadm tool


k8sWorker.sh:
-Will prepair nodes which will be worker nodes in our cluster and after this you should get token from master node to join worker nodes to the cluster.

jen.sh:
- Should be executed on k8s master node it will provision jenkins container, later we will use jenkins for CI process

argo.sh:
-Should be executed on k8s master node and it will provision ArgoCD application in our k8s cluster. Application will be used as GitOps to deploying applications from github to our k8s cluster.
