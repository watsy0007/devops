FROM upos
MAINTAINER ruijiancao@zhulux.com

RUN mv /etc/supervisor/conf.d /etc/supervisor/conf.d.bak
ADD conf /etc/supervisor/conf.d

CMD ["/usr/bin/supervisord", "-n"]
