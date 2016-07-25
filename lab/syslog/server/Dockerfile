# As a try syslog server to aggregate logs from app nodes
FROM upos
MAINTAINER ruijiancao@zhulux.com

COPY conf/ports.conf /etc/rsyslog.d/ports.conf

CMD ["rsyslogd", "-n"]
