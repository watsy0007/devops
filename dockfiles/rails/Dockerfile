FROM ruby:2.3.1
MAINTAINER borisding@zhulux.com

RUN apt-get update \
  && apt-get install postgresql-client libpq-dev graphicsmagick imagemagick ghostscript libgs-dev -y \
  && rm -rf /var/lib/apt/lists/*

RUN gem install bundler --version "$BUNDLER_VERSION" && \
    gem install rails --version "$RAILS_VERSION"

CMD [ "irb" ]
