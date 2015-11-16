FROM alpine:3.2
MAINTAINER Arnaud de Mouhy <arnaud.demouhy@akerbis.com>

ADD rootfs /
EXPOSE 80

RUN sh /build.sh

CMD ["sh", "/run.sh"]
