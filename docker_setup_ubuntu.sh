#!/bin/bash
echo "Add Docker's official GPG key"
echo "Updating apt repo"
echo "==================================================="
sudo apt-get update &> /dev/null
sleep 20

sudo apt-get install ca-certificates curl
sleep 2
sudo install -m 0755 -d /etc/apt/keyrings
sleep 3
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sleep 3
sudo chmod a+r /etc/apt/keyrings/docker.asc
sleep 2

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sleep 2
echo "updating apt repo"
echo "==================================================="
sudo apt-get update
sleep 3
echo
echo "installing docker packages"
echo "==================================================="
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y &> /dev/null
sleep 25
echo

echo "Docker status"
echo "==================================================="
sudo systemctl is-active docker
echo
