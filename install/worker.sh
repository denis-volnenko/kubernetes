#!/bin/bash

sudo apt-get update

sudo apt-get install -y mc curl fail2ban apt-transport-https ntpdate
sudo apt-get install -y docker.io

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
apt-get install -y kubeadm kubelet kubectl kubernetes-cni
