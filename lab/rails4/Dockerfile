FROM lab/ruby
MAINTAINER ruijiancao@zhulux.com

RUN apt-get update
RUN apt-get install -y \
    postgresql-client graphicsmagick imagemagick

RUN gem install rails -v 4.2.6

CMD ["bash"]
