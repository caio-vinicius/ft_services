FROM alpine:3.12

LABEL maintainer="Caio Vinicius <caio@42sp.org.br>" \
      version="1.0.0"

RUN apk update && apk add mysql && \
    mkdir /run/mysqld && \
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

COPY wordpress.sql .

ENTRYPOINT ["mysqld", "--user=root", "--skip_networking=0", "--init-file=/wordpress.sql"]
