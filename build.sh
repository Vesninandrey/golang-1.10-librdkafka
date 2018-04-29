
#!/bin/bash
set -e -x -u

BUILD_PACKAGES="build-essential git liblz4-dev libsasl2-dev libssl-dev pkg-config python zlib1g-dev wget"
RUNTIME_PACKAGES="openssl"

export DEBIAN_FRONTEND=noninteractive
export PATH="${PATH}:/usr/local/go/bin"

apt-get -y update
apt-get -y upgrade
apt-get -y install ${BUILD_PACKAGES} ${RUNTIME_PACKAGES}

# librdkafka
git clone --depth 1 -b "${LIBRDKAFKA_REF}" -- https://github.com/edenhill/librdkafka librdkafka
cd librdkafka
./configure
make
make install
ldconfig
cd ..
rm -rf librdkafka

# clean up
apt-get -y remove --purge ${BUILD_PACKAGES}
apt-get -y autoremove --purge
apt-get -y clean
