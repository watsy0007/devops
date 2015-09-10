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

aptitude install -y gcc cmake g++ zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt1-dev libcur14-openssl-dev libffi-dev libpcre3-dev libjemalloc-dev gawk autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config

read -p "Install Mysql Client (y/n)?"
if [ "$REPLY" == "y" ]; then
    aptitude install -y libmysqlclient-dev mysql-client
fi
clear
read -p "Install PGsql Client (y/n)?"
if [ "$REPLY" == "y" ]; then
    aptitude install -y libpq-dev postgresql-client
fi
clear
read -p "Install Oracle JRE (y/n)?"
if [ "$REPLY" == "y" ]; then
    add-apt-repository -y ppa:webupd8team/java
    aptitude update
    aptitude install -y oracle-java8-install oracle-java8-set-default
fi
