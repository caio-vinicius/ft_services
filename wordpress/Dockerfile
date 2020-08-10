FROM alpine:3.12

LABEL maintainer="Caio Vinicius <caio@42sp.org.br>" \
      version="1.0.0"

RUN apk update && \
    apk add lighttpd php7-common php7-iconv php7-json \
    php7-gd php7-curl php7-xml php7-mysqli php7-imap \
    php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap \
    php7-xmlrpc php7-posix php7-mcrypt php7-gettext \
    php7-ldap php7-ctype php7-dom mysql mysql-client && \
    mkdir /var/run/lighttpd && \
    chown -R lighttpd:lighttpd /var/run/lighttpd && \
    mkdir -p /usr/share/webapps/

ADD wordpress-5.4.2.tar.gz /usr/share/webapps

RUN chown -R lighttpd /usr/share/webapps/ && \
    ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress

WORKDIR /etc/lighttpd

COPY lighttpd.conf .
COPY mod_fastcgi.conf .
COPY index.html /var/www/localhost/htdocs

EXPOSE 5050

ENTRYPOINT ["lighttpd","-D", "-f", "lighttpd.conf"]
