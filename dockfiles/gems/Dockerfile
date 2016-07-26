FROM daocloud.io/zhulux/rails:rails_v5.0.0

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install libpq-dev libgs-dev -y && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp/bundler
WORKDIR /tmp/bundler
COPY Gemfile /tmp/bundler
RUN bundle install

CMD ['bash']
