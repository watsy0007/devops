FROM daocloud.io/zhulux/base_image:base_v1.0
MAINTAINER borisding@zhulux.com
ENV BUNDLER_VERSION 1.12.5
ENV RAILS_VERSION 5.0.0

RUN apt-get update && \
    apt-get install ruby2.3 ruby2.3-dev git \
    postgresql-client graphicsmagick imagemagick ghostscript libpq-dev libmysqlclient-dev libgs-dev -y && \
    rm -rf /var/lib/apt/lists/*

RUN gem install bundler --version "$BUNDLER_VERSION" && \
    gem install rails --version "$RAILS_VERSION" && \
    gem install pry

CMD [ "pry" ]
