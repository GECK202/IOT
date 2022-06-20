#!/bin/bash
sudo systemctl disable firewalld.service --now

sudo dnf -y install net-tools

export INSTALL_K3S_EXEC="--node-ip=$NODE_IP"

export K3S_KUBECONFIG_MODE="644"

curl -sfL https://get.k3s.io | sh -