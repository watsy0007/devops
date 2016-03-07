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
sed -i "s/PermitRootLogin no/PermitRootLogin yes/g" /etc/ssh/sshd_config
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDSInLemGh67GRJlet+ns8nqwsFTFkHnGV+VWIatqahbPpMlTAT41ZGPcNC8T/fCVQiQcuxpAQSsCKpq3Jc+SpEapZD8fyFsbIcHIwNHaTJGrp8Bxc3sjT4e+MgSzop0+1b7fh0VngRk/uKZR69dfCU+GtjX52iINdvjOopYLxMH3128IIdO2P0Hi/PSvWslqpbh9I7mBY0W7NqxCcWVZ/+3awtl1BBAOeFBr0utzLyd8MgT7g9WuPKSuGrY2S7v3gr+05veAhcC8QG/8jxVuiXqfub5WLAwBZ24688QwkdYhDdr2N3+v7WThKOVAm7Hs95YI0DLbGIYv1NxTQzd0g1 BorisDing@dinglis-MBP.lan' >> ~/.ssh/authorized_keys
add-apt-repository -y ppa:webupd8team/java
aptitude update
aptitude install -y oracle-java8-install oracle-java8-set-default graphicsmagick imagemagick ghostscript libgs-dev pdftk poppler-utils libpoppler-dev monit cron libmysqlclient-dev mysql-client libpq-dev postgresql-client gcc cmake g++ zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt1-dev libcur14-openssl-dev libffi-dev libpcre3-dev libjemalloc-dev gawk autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
source ~/.profile
nvm install 5.2.0
nvm alias default 5.2.0
nvm use default
npm install -g cnpm 
cnpm install -g bower cordova ionic grunt yo
\curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm requirements
rvm install ruby-2.3.0
rvm use ruby-2.3.0 --default
gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/
gem install bundler 

