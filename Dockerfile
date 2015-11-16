FROM debian:stable
MAINTAINER Arnaud de Mouhy <arnaud.demouhy@akerbis.com>

ADD rootfs /
EXPOSE 80

RUN bash /build.sh

CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
