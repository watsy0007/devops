FROM lab/ruby
MAINTAINER ruijiancao@zhulux.com

RUN apt-get update
RUN apt-get install -y \
    build-essential patch zlib1g-dev liblzma-dev \
    postgresql-client graphicsmagick imagemagick

RUN gem install rails -v 4.2.6

CMD ["bash"]
