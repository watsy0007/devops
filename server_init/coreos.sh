#!/bin/bash
if [ $(lsb_release -c -s) != "trusty" ]; then
    echo "This script must be run as Ubuntu Trusty" 1>&2
    exit 1
fi
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi
bash ./ubuntu_trusty.sh
apt-get -y purge tcpdump nano ufw
curl -sSL https://get.daocloud.io/docker | sh
service docker stop
echo "DOCKER_OPTS=\"-g /alidata1\"" > /etc/default/docker
echo "Inpur Daocloud Key:"
read key
curl -sSL https://get.daocloud.io/daomonit/install.sh | sh -s $key
echo 'done.'
