FROM sillelien/base-alpine:0.10
MAINTAINER Arnaud de Mouhy <arnaud.demouhy@akerbis.com>

ADD rootfs /
EXPOSE 80

RUN sh /build.sh
