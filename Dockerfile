FROM ubuntu:14.04.2
MAINTAINER miurahr@linux.com

RUN scripts/setup-base.sh && \
    scripts/install.sh && \
    scripts/clean-deb.sh

EXPOSE 80

