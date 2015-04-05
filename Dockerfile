FROM ubuntu:14.04.2
MAINTAINER miurahr@linux.com


ADD install /opt/
RUN chmod 755 /opt/install
ADD config /opt/config
RUN /opt/install

ADD init /opt/
RUN chmod 755 /opt/init

EXPOSE 80

VOLUME ["/var/log/supervisor"]

WORKDIR /home/hubot
ENTRYPOINT ["/opt/init"]
CMD ["app:start"]

