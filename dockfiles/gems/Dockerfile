FROM daocloud.io/zhulux/rails:rails_v5.0.0

WORKDIR /tmp/bundler
COPY Gemfile /tmp/bundler
RUN bundle install

CMD ['bash']
