FROM alpine:3.12

LABEL maintainer="Caio Vinicius <caio@42sp.org.br>" \
      version="1.0.0"

RUN mkdir -p /run/nginx && apk update && apk add nginx
COPY ssl/server.crt /etc/ssl/certs/
COPY ssl/server.key /etc/ssl/private/
COPY default.conf /etc/nginx/conf.d

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
