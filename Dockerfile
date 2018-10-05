FROM alpine:latest
MAINTAINER mara https://github.com/ma-ra

RUN apk add --update squid tzdata && \
    cp /usr/share/zoneinfo/Europe/Warsaw /etc/localtime && \
    echo "Europe/Warsaw" >  /etc/timezone && \
    apk del tzdata && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

ADD entrypoint.sh /usr/local/bin/

EXPOSE 3128/tcp

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
