#!/bin/bash

set -eux

# Launch Indy Besu pool
echo "### Launch Indy Besu pool ###"
if [ ! -d "indy-besu" ]; then
  git clone https://github.com/DSRCorporation/indy-besu.git
fi
pushd indy-besu
git checkout indy-besu-demo
bash ./network/scripts/run.sh -b
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
fi
pushd aries-framework-javascript
git checkout indy-besu-demo-using-did-ethr
chmod -R 777 .
