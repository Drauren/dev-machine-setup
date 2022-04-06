#!/bin/bash

read -p "This will install a LOT of stuff. Are you sure?" -n 1 -r
echo "\n" # (optional) move to a new line
if [[ $REPLY =~ ^[nN]$ ]]
then
    exit
fi

# General
brew install --cask firefox
brew install --cask visual-studio-code
brew install --cask postman
brew install tmux

# k8s related
brew install kubectl
brew install helm
brew install derailed/k9s/k9s
brew install dive
