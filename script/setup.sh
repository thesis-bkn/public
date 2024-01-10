#!/bin/bash
# Script to install python

export PYTHON_VERSION="3.11.5"

sudo DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y build-essential

echo "Install python"
sudo apt-get install libssl-dev openssl
wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz
tar xzvf Python-$PYTHON_VERSION.tgz
cd Python-$PYTHON_VERSION || echo "Failed to install python"
./configure
make
sudo make install