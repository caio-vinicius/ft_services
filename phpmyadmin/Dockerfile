FROM alpine:3.12

LABEL maintainer="Caio Vinicius <caio@42sp.org.br>" \
      version="1.0.0"

RUN apk update && apk add lighttpd php7-common \
    php7-iconv php7-json php7-gd php7-curl php7-xml \
    php7-mysqli php7-imap php7-cgi fcgi php7-pdo \
    php7-pdo_mysql php7-soap php7-xmlrpc php7-posix \
    php7-mcrypt php7-mbstring php7-gettext php7-ldap \
    php7-ctype php7-dom php7-session wget && \
    mkdir /var/run/lighttpd && \
    chown -R lighttpd:lighttpd /var/run/lighttpd && \
    wget --quiet https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-english.tar.gz && \
    tar -xf phpMyAdmin-4.9.5-english.tar.gz -C /var/www/localhost/ && \
    rm -rf phpMyAdmin-4.9.5-english.tar.gz && \
    chown -R lighttpd /var/www/localhost/phpMyAdmin-4.9.5-english

#ADD phpMyAdmin-4.9.5-english.tar.gz /var/www/localhost/
#RUN chown -R lighttpd /var/www/localhost/phpmyadmin/

COPY config/config.inc.php /var/www/localhost/phpMyAdmin-4.9.5-english/

WORKDIR /etc/lighttpd

COPY config/lighttpd.conf .
COPY config/mod_fastcgi.conf .

EXPOSE 5000

ENTRYPOINT ["lighttpd","-D", "-f", "lighttpd.conf"]
