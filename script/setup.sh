#!/bin/bash
# Script to install python

export PYTHON_VERSION="3.11.5"
export DEBIAN_FRONTEND=noninteractive

sudo apt-get update && apt-get install -y build-essential pkg-config cmake-data zlib1g zlib1g-dev libssl-dev libbz2-dev libsqlite3-dev

echo "Install python"
sudo apt-get install libssl-dev openssl
wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz
tar xzvf Python-$PYTHON_VERSION.tgz
cd Python-$PYTHON_VERSION || echo "Failed to install python"
./configure
make
sudo make install

python -m pip install --upgrade pip
