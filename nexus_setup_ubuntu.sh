#!/bin/bash
sudo apt update
sudo apt install openjdk-11-jdk -y
sudo cd /opt
wget https://download.sonatype.com/nexus/3/nexus-3.83.0-08-linux-x86_64.tar.gz
tar -xvzf nexus-3.83.0-08-linux-x86_64.tar.gz
mv /opt/nexus-3.83.0-08 /opt/nexus
sudo useradd -m -U -d /opt/nexus -s /bin/false nexus
sudo chown -R nexus:nexus /opt/nexus /opt/sonatype-work

cat <<EOF | sudo tee /etc/systemd/system/nexus.service > /dev/null
[Unit]
Description=Nexus Repository Manager
After=network.target

[Service]
Type=forking
LimitNOFILE=65536
User=nexus
Group=nexus
ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop
Restart=on-abort

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sleep 3
sudo systemctl start nexus
