FROM ubuntu:14.04
MAINTAINER borisding@huaxing.com
ENV RUBY_VERSION 2.2.3



ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
&& apt-get install -y curl nodejs nodejs-legacy npm \
&& useradd --home /home/agent -M agent -K UID_MIN=1000 -K GID_MIN=10000 -s /bin/bash \
&& mkdir /home/agent \
&& chown agent:agent /home/agent && adduser agent sudo \
&& echo 'agent ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER agent

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
&& \curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c 'source ~/.rvm/scripts/rvm' \
&& /bin/bash -l -c 'rvm requirements' \
&& /bin/bash -l -c 'rvm get head' \
&& /bin/bash -l -c 'rvm install $RUBY_VERSION --patch railsexpress' \
&& /bin/bash -l -c 'rvm use $RUBY_VERSION --default' \
&& /bin/bash -l -c 'gem install bundler --no-doc --no-ri'
