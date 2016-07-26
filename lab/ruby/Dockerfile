FROM upos
MAINTAINER ruijiancao@zhulux.com

RUN apt-get update && \
    apt-get install -y ruby2.3 ruby2.3-dev

COPY dot.gemrc /root/.gemrc
COPY script /script
RUN chmod +x /script/* 
RUN /script/cgem taobao
RUN gem install pry

CMD [ "pry" ]
