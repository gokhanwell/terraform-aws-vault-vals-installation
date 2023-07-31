#! /bin/bash

#vals
apt update -y
wget https://github.com/gokhanwell/vals/raw/main/vals
chmod 755 vals
mv vals /usr/local/bin/

#vault
sudo curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" -y
apt update -y
apt install vault -y
systemctl enable vault
systemctl start vault