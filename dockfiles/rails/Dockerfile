FROM daocloud.io/zhulux/base_image:latest
MAINTAINER borisding@zhulux.com
ENV BUNDLER_VERSION 1.12.1
ENV RAILS_VERSION 4.2.6

RUN apt-add-repository ppa:brightbox/ruby-ng && apt-get update && \
    apt-get install ruby2.3 ruby2.3-dev \
    postgresql-client graphicsmagick imagemagick ghostscript libgs-dev && \
    rm -rf /var/lib/apt/lists/*
    
RUN gem install bundler --version "$BUNDLER_VERSION" && \
    gem install rails --version "$RAILS_VERSION"

