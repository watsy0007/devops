FROM daocloud.io/zhulux/rails:rails_v5.0.0

RUN apt-get install libmysqlclient-dev -y

RUN mkdir -p /tmp/bundler
WORKDIR /tmp/bundler
COPY Gemfile /tmp/bundler
RUN bundle install

CMD ['bash']
