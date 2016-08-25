FROM daocloud.io/zhulux/rails:rails_v4.2.7

RUN mkdir -p /tmp/bundler
WORKDIR /tmp/bundler
COPY Gemfile /tmp/bundler
RUN bundle install

CMD ['irb']
