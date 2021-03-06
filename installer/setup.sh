#!/bin/bash

if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed. Please install git.' >&2
  exit 1
fi
git clone https://github.com/aaronstuder/lxq.git /opt/lxq
chmod a+x /opt/lxq/lxq
echo "export PATH=$PATH:/opt/lxq" >> ~/.profile
source ~/.profile

echo
echo "#################"
echo "Install Complete!"
echo "Run: source ~/.profile to use LXQ now."
echo "#################"
echo
