#!/bin/bash

echo "================================================"
echo "Installing jenkins dependency java 11"
echo "================================================"
sudo amazon-linux-extras install java-openjdk11 -y > /dev/null
echo

echo "================================================"
echo "Verify java version"
echo "================================================"
java -version

echo "================================================"
echo "setting jenkins repo and creating key rings"
echo "================================================"
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
echo

echo "================================================"
echo "installing Jenkins"
echo "================================================"
sudo yum install jenkins -y > /dev/null
echo

echo "================================================"
echo "Starting jenkins service"
echo "================================================"
sudo systemctl start jenkins
echo

echo "================================================"
echo "status of jenkins service"
echo "================================================"
sudo systemctl is-active jenkins
echo

echo "================================================"
echo "initial password for jenkins"
echo "================================================"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo
