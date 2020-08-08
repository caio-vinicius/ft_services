FROM alpine:3.6

WORKDIR /etc/vsftpd
RUN apk update && apk add vsftpd
COPY vsftpd.conf .
