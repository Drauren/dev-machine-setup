#!/bin/bash

read -p "This will install a LOT of stuff. Are you sure?" -n 1 -r
echo "\n" # (optional) move to a new line
if [[ $REPLY =~ ^[nN]$ ]]
then
    exit
fi

# General
## Firefox
sudo snap install firefox
## VScode
sudo snap install code --classic
## Postman
sudo snap install postman
## tmux
sudo apt-get install tmux

# k8s related
## Kubectl
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
touch ~/.kube/config
chmod 600 ~/.kube/config
## Helm
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
## tmux
sudo apt-get install tmux
## k9s
wget https://github.com/derailed/k9s/releases/download/v0.25.18/k9s_Linux_x86_64.tar.gz
tar -xvf k9s_Linux_x86_64.tar.gz
sudo mv k9s /usr/local/bin
rm -rf LICENSE README.md k9s_Linux_x86_64.tar.gz
## dive
wget https://github.com/wagoodman/dive/releases/download/v0.9.2/dive_0.9.2_linux_amd64.deb
sudo apt install ./dive_0.9.2_linux_amd64.deb

# Terraform
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform