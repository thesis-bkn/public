#!/bin/bash
# Script to install python

export PYTHON_VERSION="3.11.5"

apt-get update
apt-get install build-essential

echo "Install python"
sudo apt-get install libssl-dev openssl
wget https://www.python.org/ftp/python/"$(PYTHON_VERSION)"/"$(PYTHON_VERSION)".tgz
tar xzvf "$(PYTHON_VERSION)".tgz
cd "$(PYTHON_VERSION)" || echo "Failed to install python"
./configure
make
sudo make install