FROM ubuntu:16.04
MAINTAINER borisding@zhulux.com

ENV DEBIAN_FRONTEND noninteractive
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV TZ Asia/Shanghai

RUN locale-gen $LANGUAGE && \
    dpkg-reconfigure locales && \
    dpkg-reconfigure -f noninteractive tzdata  && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get upgrade  -y && apt-get install software-properties-common -y && apt-get clean && \
rm -rf /usr/share/doc/* && \
rm -rf /usr/share/locale/* && \
rm -rf /usr/share/man/* && \
rm -rf /var/cache/debconf/*-old && \
rm -rf /var/lib/apt/lists/*

CMD ["bin/bash"]
