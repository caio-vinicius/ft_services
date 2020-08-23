FROM alpine:3.12

LABEL maintainer="Caio Vinicius <caio@42sp.org.br>" \
      version="1.0.0"

ENV PATH=/influxdb-1.8.1-1:$PATH

RUN apk update && apk add wget && \
    wget --quiet https://dl.influxdata.com/influxdb/releases/influxdb-1.8.1-static_linux_amd64.tar.gz && \
    tar -xf influxdb-1.8.1-static_linux_amd64.tar.gz && \
    rm -rf influxdb-1.8.1-static_linux_amd64.tar.gz
    
EXPOSE 8086

ENTRYPOINT ["influxd"]
