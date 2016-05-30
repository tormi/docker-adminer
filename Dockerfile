FROM alpine:latest
MAINTAINER Arnaud de Mouhy <arnaud.demouhy@akerbis.com>

COPY rootfs /
EXPOSE 80

RUN sh /build.sh && rm /build.sh

ENTRYPOINT ["/bin/s6-svscan", "/etc/services.d"]
CMD []
