#!/bin/bash
sudo apt update
sleep 5
sudo apt install openjdk-21-jdk -y
sleep 5
sudo mkdir -p /opt/tomcat
wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.108/bin/apache-tomcat-9.0.108.tar.gz
sleep 3
tar -xvzf apache-tomcat-9.0.108.tar.gz
sleep 3
mv apache-tomcat-9.0.108/* /opt/tomcat/
sudo useradd -m -U -d /opt/tomcat -s /bin/false tomcat
sudo chown -R tomcat:tomcat /opt/tomcat

cat <<EOF | sudo tee /etc/systemd/system/tomcat.service > /dev/null
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

User=tomcat
Group=tomcat

Environment="JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64"
Environment="CATALINA_HOME=/opt/tomcat"
Environment="CATALINA_BASE=/opt/tomcat"

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

sleep 2

sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl start tomcat
sleep 3
sudo systemctl enable tomcat
