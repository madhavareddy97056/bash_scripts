#!/bin/bash

echo "================================================"
echo "Updating OS packages"
echo "================================================"
sudo apt update -y > /dev/null
sleep 5
echo

echo "================================================"
echo "Installing jenkins dependency java 17"
echo "================================================"
sudo apt install openjdk-17-jdk -y > /dev/null
sleep 5
echo

echo "================================================"
echo "Verify java version"
echo "================================================"
java -version
sleep 2
echo

echo "================================================"
echo "setting jenkins repo and creating key rings"
echo "================================================"
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
    sleep 3
echo

echo "================================================"
echo "Updating packages"
echo "================================================"
sudo apt update &> /dev/null
sleep 5
echo

echo "================================================"
echo "installing Jenkins"
echo "================================================"
sudo apt install jenkins -y > /dev/null
sleep 5
echo

echo "================================================"
echo "status of jenkins service"
echo "================================================"
sudo systemctl is-active jenkins
sleep 1
echo

echo "================================================"
echo "initial password for jenkins"
echo "================================================"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo
