FROM rails:4.2.7.1

RUN apt-get update && apt-get upgrade -y && \
    apt-get install git -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp/bundler
WORKDIR /tmp/bundler
COPY Gemfile /tmp/bundler
RUN bundle install

CMD ['bash']
