FROM alpine:3.12

LABEL maintainer="Caio Vinicius <caio@42sp.org.br>" \
      version="1.0.0"

ENV PATH=/grafana-7.1.3/bin:$PATH

RUN apk update && apk add libc6-compat wget && \
    wget --quiet https://dl.grafana.com/oss/release/grafana-7.1.3.linux-amd64.tar.gz && \
    tar -xf grafana-7.1.3.linux-amd64.tar.gz && \
    rm -rf grafana-7.1.3.linux-amd64.tar.gz && \
    mkdir -p /var/lib/grafana/dashboards

WORKDIR /grafana-7.1.3

COPY provisioning/dashboard.json /var/lib/grafana/dashboards/
COPY provisioning/influxdb.yaml conf/provisioning/datasources/
COPY provisioning/dashboard.yaml conf/provisioning/dashboards/

EXPOSE 3000

ENTRYPOINT ["grafana-server"]
