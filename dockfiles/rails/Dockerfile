FROM daocloud.io/zhulux/base_image:base_v1.0
MAINTAINER borisding@zhulux.com
ENV BUNDLER_VERSION 1.12.5
ENV RAILS_VERSION 4.2.6

RUN apt-get update && \
    apt-get install ruby2.3 ruby2.3-dev \
    postgresql-client graphicsmagick imagemagick ghostscript libgs-dev -y && \
    rm -rf /var/lib/apt/lists/*

# RUN ln -s /usr/bin/ruby2.3 /usr/bin/ruby && \
    # ln -s /usr/bin/gem2.3 /usr/bin/gem

RUN gem install bundler --version "$BUNDLER_VERSION" && \
    gem install rails --version "$RAILS_VERSION" && \
    gem install pry

CMD [ "pry" ]
