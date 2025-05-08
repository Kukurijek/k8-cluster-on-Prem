#!/usr/bin/env bash

sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=${PRIMARY_IP}

mkdir -p ~/.kube
sudo cp /etc/kubernetes/admin.conf ~/.kube/config
sudo chown $(id -u):$(id -g) ~/.kube/config
chmod 600 ~/.kube/config
sudo kubeadm token create --print-join-command | sudo tee /tmp/join-command.sh > /dev/null
sudo chmod +x /tmp/join-command.sh

for s in $(seq 60 -10 10)
do
    echo "Waiting $s seconds for all control plane pods to be running"
    sleep 10
done
