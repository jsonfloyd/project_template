FROM php:7.4.0-fpm-alpine

RUN apk add --no-cache bash supervisor nginx

RUN mkdir -p /opt/confd/bin && \
    mkdir -p /var/lib/nginx && \
    mkdir -p /var/lib/nginx/tmp && \
    mkdir -p /run/nginx

RUN nginx -V
ADD https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 /usr/local/bin/confd



COPY ./etc/supervisor.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./etc/confd /etc/confd
COPY ./etc/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/confd && \
    chmod +x /usr/local/bin/entrypoint.sh

COPY ./src/app /app
ENTRYPOINT sh /usr/local/bin/entrypoint.sh