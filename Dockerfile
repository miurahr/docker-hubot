FROM ubuntu:14.04.2
MAINTAINER miurahr@linux.com

ADD assets/install /tmp/
ADD config /tmp/
RUN chmod 755 /tmp/install
RUN /tmp/install
RUN rm /tmp/install

ADD assets/init /opt/app/
RUN chmod 755 /opt/app/init

EXPOSE 80

VOLUME ["/var/log/supervisor"]

WORKDIR /home/hubot
ENTRYPOINT ["/opt/app/init"]
CMD ["app:start"]

