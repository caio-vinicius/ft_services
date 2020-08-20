FROM alpine:3.12

LABEL maintainer="Caio Vinicius <caio@42sp.org.br>" \
      version="1.0.0"

ADD grafana-7.1.3.linux-amd64.tar.gz .

WORKDIR /grafana
ENV PATH=/grafana/bin:$PATH
RUN apk update && apk add libc6-compat && \
    mkdir -p /var/lib/grafana/dashboards

COPY dashboard.json /var/lib/grafana/dashboards
COPY influxdb.yaml conf/provisioning/datasources/
COPY dashboard.yaml conf/provisioning/dashboards

VOLUME /myvol

EXPOSE 3000

ENTRYPOINT ["grafana-server"]
