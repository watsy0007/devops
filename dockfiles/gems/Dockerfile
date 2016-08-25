FROM daocloud.io/zhulux/rails_v4.2.7.1

RUN mkdir -p /tmp/bundler
WORKDIR /tmp/bundler
COPY Gemfile /tmp/bundler
RUN bundle install

CMD ['irb']
