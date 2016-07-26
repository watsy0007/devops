#NOTE: As base os and base packages
FROM ubuntu:16.04
MAINTAINER ruijiancao@zhulux.com

ENV DEBIAN_FRONTEND noninteractive
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV TZ Asia/Shanghai

RUN locale-gen $LANGUAGE && \
    dpkg-reconfigure locales && \
    dpkg-reconfigure -f noninteractive tzdata  && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN rm  -rf /etc/apt/sources.list /etc/apt/sources.list.d
COPY conf/apt-sources.list /etc/apt/sources.list

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y supervisor rsyslog

# dev helper
RUN apt-get install -y curl vim

RUN apt-get clean && \
    rm -rf /usr/share/doc/* && \
    rm -rf /usr/share/man/* && \
    rm -rf /var/cache/debconf/*-old 
    #rm -rf /usr/share/locale/* && \
    #rm -rf /var/lib/apt/lists/*

CMD ["bash"]
