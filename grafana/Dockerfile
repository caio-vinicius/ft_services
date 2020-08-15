FROM alpine:3.12

LABEL maintainer="Caio Vinicius <caio@42sp.org.br>" \
      version="1.0.0"

ADD grafana-7.1.3.linux-amd64.tar.gz .

WORKDIR /grafana
ENV PATH=/grafana/bin:$PATH
RUN apk update && apk add libc6-compat
COPY influxdb.yaml conf/provisioning/datasources/

EXPOSE 3000

ENTRYPOINT ["grafana-server"]
