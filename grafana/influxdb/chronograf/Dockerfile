FROM alpine:3.12

LABEL maintainer="Caio Vinicius <caio@42sp.org.br>" \
      version="1.0.0"

ADD chronograf-1.8.5_linux_amd64.tar.gz /tmp
WORKDIR /tmp/chronograf-1.8.5-1

RUN apk update && apk add libc6-compat && \
    cp -r ./etc/* /etc/ && cp -r ./usr/lib/* /usr/lib/ && \
    cp -r ./usr/bin/* /usr/bin/ && cp -r ./usr/share/* /usr/share/ && \
    cp -r ./var/log/* /var/log/ && cp -r ./var/lib/* /var/lib/ && \
    mkdir -p /etc/default/

ENTRYPOINT ["chronograf"]
