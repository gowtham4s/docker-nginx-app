# Use Alpine as base image
FROM alpine:latest

RUN apk update && apk add --no-cache nginx

RUN mkdir -p /run/nginx

# Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy your HTML website into the nginx folder
COPY . /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

