FROM ubuntu:14.04
MAINTAINER borisding@huaxing.com
ENV TENGINE_VERSION 2.1.1

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
&& apt-get install -y build-essential make autoconf automake curl libjemalloc-dev openssl libssl-dev libpcre3-dev libxml2

RUN curl -SL "http://tengine.taobao.org/download/tengine-${TENGINE_VERSION}.tar.gz" -o tengine.tar.gz \
&& mkdir /usr/src/tengine \
&& tar -xvf tengine.tar.gz -C /usr/src/tengine --strip-components=1 \
&& rm tengine.tar.gz* && cd /usr/src/tengine \
&& sed -i '/#define TENGINE/s/"Tengine"/"ZhuluX-Srv"/' ./src/core/nginx.h \
&& ./configure \
  --user=www-data \
  --group=www-data \
  --prefix=/usr/local/nginx \
  --with-jemalloc \
  --without-dso \
  --with-pcre \
  --with-http_concat_module \
  --with-http_gzip_static_module \
  --with-http_realip_module \
  --with-http_ssl_module \
  --with-http_spdy_module \
&& make -j"$(nproc)" \
&& make install \
&& cd / \
&& rm -r /usr/src/tengine \
&& chown -R www-data:www-data /usr/local/nginx

ENV PATH /usr/local/nginx/sbin:$PATH
RUN mkdir /usr/local/nginx/certs
RUN mkdir /usr/local/nginx/conf/sites
ADD nginx.conf /usr/local/nginx/conf/nginx.conf
VOLUME ["/usr/local/nginx/conf/sites","/usr/local/nginx/certs"]
RUN ln -sf /dev/stdout /usr/local/nginx/logs/access.log
RUN ln -sf /dev/stderr /usr/local/nginx/logs/error.log
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80 443
