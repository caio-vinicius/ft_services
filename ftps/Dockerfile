FROM alpine:3.12

LABEL maintainer="Caio Vinicius <caio@42sp.org.br>" \
      version="1.0.0"

ENV USER caio

RUN apk update && apk add vsftpd && \
    adduser -D $USER && passwd -d $USER && \
    mkdir /home/$USER/ftp && \
    chown $USER /home/$USER/ftp && chmod 757 /home/$USER/ftp

COPY ftp.txt /home/$USER/ftp/ 
COPY ssl/server.crt /etc/ssl/
COPY ssl/server.key /etc/ssl/

EXPOSE 20 21 10000

ENTRYPOINT ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
