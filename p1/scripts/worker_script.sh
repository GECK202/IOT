#!/bin/bash

chmod 600 ~/private_key
while true
do
  TOKEN=$(ssh -i ~/private_key -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no vagrant@$SERVER_IP "sudo cat /var/lib/rancher/k3s/server/node-token")
  if [ $? -eq 0 ]
  then
      break
  fi
  echo "Sleep 10"
  sleep 10
done

rm ~/private_key

echo "TOKEN = $TOKEN"

sudo systemctl disable firewalld.service --now

sudo dnf -y install net-tools

export INSTALL_K3S_EXEC="--node-ip=$NODE_IP"
export K3S_URL="https://$SERVER_IP:6443"
export K3S_TOKEN=$TOKEN

curl -sfL https://get.k3s.io | sh -