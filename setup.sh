#!/bin/bash

set -eux

# Launch Indy Besu pool
echo "### Launch Indy Besu pool ###"
if [ ! -d "indy-node" ]; then
  git clone https://github.com/DSRCorporation/indy-node.git
fi
pushd indy-node
git checkout indy-besu
pushd indy-besu
bash ./network/scripts/run.sh
popd
popd

# Setup Libindy environment
echo "### Setup Libindy environment ###"
apt-get install libsodium-dev -y
apt-get install libzmq3-dev -y
wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb -P bin/
dpkg -i bin/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
cp bin/libindy.so /usr/lib/libindy.so

# Setup Aries Framework environment
echo "### Setup Aries Framework environment"
if [ ! -d "aries-framework-javascript" ]; then
    git clone https://github.com/DSRCorporation/aries-framework-javascript.git
    chmod -R 777 aries-framework-javascript
fi
pushd aries-framework-javascript/demo
git checkout indy-besu-demo
