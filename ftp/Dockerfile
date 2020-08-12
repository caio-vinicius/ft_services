FROM alpine:3.6

LABEL maintainer="Caio Vinicius <caio@42sp.org.br>" \
      version="1.0.0"

ENV USER caio

RUN apk update && apk add vsftpd && \
    adduser -D $USER && passwd -d $USER && \
    mkdir /home/$USER/ftp && \
    chown $USER /home/$USER/ftp && chmod 757 /home/$USER/ftp

COPY ftp.txt /home/$USER/ftp/ 
COPY vsftpd.conf /etc/vsftpd/

ENTRYPOINT ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
