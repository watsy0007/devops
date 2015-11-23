FROM ubuntu:14.04
MAINTAINER borisding@zhulux.com
ENV TENGINE_VERSION 2.1.1
ENV NODE_VERSION 4.2.1

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
&& apt-get install -y build-essential make autoconf automake curl libpcre3-dev libxml2 python ruby


RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
ENV NVM_DIR /root/.nvm
RUN gem install sass
RUN . ~/.nvm/nvm.sh && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION && npm install -g bower grunt-cli yo generator-karma generator-angular grunt-contrib-sass


RUN curl -SL "http://tengine.taobao.org/download/tengine-${TENGINE_VERSION}.tar.gz" -o tengine.tar.gz \
&& mkdir /usr/src/tengine \
&& tar -xvf tengine.tar.gz -C /usr/src/tengine --strip-components=1 \
&& rm tengine.tar.gz* && cd /usr/src/tengine \
&& sed -i '/#define TENGINE/s/"Tengine"/"ZhuluX-Srv"/' ./src/core/nginx.h \
&& ./configure \
  --prefix=/usr/local/nginx \
  --without-dso \
  --with-pcre \
  --without-http_proxy_module \
&& make -j"$(nproc)" \
&& make install \
&& cd / \
&& rm -r /usr/src/tengine

ENV PATH /usr/local/nginx/sbin:$PATH
ADD nginx.conf /usr/local/nginx/conf/nginx.conf
RUN ln -sf /dev/stdout /usr/local/nginx/logs/access.log
RUN ln -sf /dev/stderr /usr/local/nginx/logs/error.log
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80
