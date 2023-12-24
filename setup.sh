#!/bin/bash

source ~/.bashrc
source $NVM_DIR/nvm.sh
set -eux

# Launch Indy Besu pool
# echo "### Launch Indy Besu pool ###"
# if [ ! -d "indy-node" ]; then
#   git clone https://github.com/DSRCorporation/indy-node.git
# fi
# pushd indy-node
# git checkout indy-besu
# pushd indy-besu
# bash ./network/scripts/run.sh
# popd
# popd

# Setup Libindy environment
# echo "### Setup Libindy environment ###"
# apt-get install libsodium-dev -y
# apt-get install libzmq3-dev -y
# cp bin/libindy.so /usr/lib/libindy.so

# Setup Aries Framework environment
echo "### Setup Aries Framework environment"
if [ ! -d "aries-framework-javascript" ]; then
    git clone https://github.com/DSRCorporation/aries-framework-javascript.git
fi
pushd aries-framework-javascript/demo
git checkout indy-besu-demo
nvm install 18.0.0
