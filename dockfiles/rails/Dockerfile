FROM daocloud.io/zhulux/base_image:latest
MAINTAINER borisding@zhulux.com
ENV BUNDLER_VERSION 1.12.1
ENV RAILS_VERSION 4.2.6

RUN apt-get update && \
    apt-get install ruby2.3 ruby2.3-dev \
    postgresql-client graphicsmagick imagemagick ghostscript libgs-dev ruby-switch -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm /usr/bin/ruby && ln -s /usr/bin/ruby2.3 /usr/bin/ruby && \
	rm -fr /usr/bin/gem && ln -s /usr/bin/gem2.3 /usr/bin/gem
    
RUN gem install bundler --version "$BUNDLER_VERSION" && \
    gem install rails --version "$RAILS_VERSION" && \
    gem install pry

CMD [ "pry" ]
