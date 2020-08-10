FROM alpine:3.12

RUN mkdir -p /run/nginx && apk update && apk add nginx
COPY nginx/ssl/server.crt /etc/ssl/certs/
COPY nginx/ssl/server.key /etc/ssl/private/
COPY nginx/default.conf /etc/nginx/conf.d

EXPOSE 5050

CMD ["nginx", "-g", "daemon off;"]
