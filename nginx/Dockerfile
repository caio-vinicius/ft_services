FROM alpine:3.12

LABEL maintainer="Caio Vinicius <caio@42sp.org.br>" \
      version="1.0.0"

RUN mkdir -p /run/nginx && apk update && apk add nginx
COPY ssl/server.crt /etc/nginx/ssl/
COPY ssl/server.key /etc/nginx/ssl/

EXPOSE 80 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
