# Use Alpine as base image
FROM alpine:latest

RUN apk update && apk add --no-cache nginx

RUN mkdir -p /run/nginx

COPY . /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

