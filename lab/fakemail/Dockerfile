# ref https://github.com/schickling/dockerfiles/tree/master/mailcatcher
#FROM lab/ruby
FROM zhulux/ruby:2.3.0
MAINTAINER ruijiancao@zhulux.com

ADD install.sh install.sh
RUN chmod +x install.sh
RUN ./install.sh && rm install.sh

# smtp port
EXPOSE 1025

# webserver port
EXPOSE 1080

#--foreground --ip 0.0.0.0 --http-port 1026 --verbose --browse
CMD ["mailcatcher", "--foreground", "--ip=0.0.0.0", "--verbose"]
