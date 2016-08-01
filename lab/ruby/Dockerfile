FROM upos
MAINTAINER ruijiancao@zhulux.com

RUN apt-get update && apt-get install -y \ 
    build-essential patch \
    zlib1g-dev liblzma-dev \
    ruby2.3 ruby2.3-dev

COPY dot.gemrc /root/.gemrc
ADD script /script
RUN /script/cgem taobao

RUN gem install byebug pry

CMD [ "pry" ]
