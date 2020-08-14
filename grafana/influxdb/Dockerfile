FROM alpine:3.12

ADD influxdb-1.8.1-static_linux_amd64.tar.gz .
ENV PATH=/influxdb-1.8.1-1:$PATH

ENTRYPOINT ["influxd"]
