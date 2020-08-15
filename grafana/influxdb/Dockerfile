FROM alpine:3.12

LABEL maintainer="Caio Vinicius <caio@42sp.org.br>" \
      version="1.0.0"

ADD influxdb-1.8.1-static_linux_amd64.tar.gz .
ENV PATH=/influxdb-1.8.1-1:$PATH

EXPOSE 8086

ENTRYPOINT ["influxd"]
