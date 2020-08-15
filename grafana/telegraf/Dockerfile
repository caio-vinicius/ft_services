FROM alpine:3.12

LABEL maintainer="Caio Vinicius <caio@42sp.org.br>" \
      version="1.0.0"

ADD telegraf-1.15.2_linux_amd64.tar.gz /tmp
WORKDIR /tmp/telegraf-1.15.2

RUN apk update && apk add libc6-compat && \
    cp -r ./etc/* /etc/ && cp -r ./usr/lib/* /usr/lib/ && \
    cp -r ./usr/bin/* /usr/bin/ && cp -r ./var/log/* /var/log/

COPY telegraf.conf /etc/telegraf/

ENTRYPOINT ["telegraf"]
