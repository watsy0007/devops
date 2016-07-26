FROM daocloud.io/zhulux/rails:rails_v5.0.0

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install postgresql-client libpq-dev libmysqlclient-dev -y

RUN mkdir -p /tmp/bundler
WORKDIR /tmp/bundler
COPY Gemfile /tmp/bundler
RUN bundle install

CMD ['bash']
