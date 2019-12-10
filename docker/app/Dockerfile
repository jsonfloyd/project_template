FROM php:7.4.0-fpm-alpine

### BUILD DEPTHS ###
RUN apk add --no-cache --virtual build-dependencies autoconf g++ make
### RUNTIME DEPTHS ###
RUN apk add --no-cache bash supervisor nginx curl postgresql-dev composer
ADD https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 /usr/local/bin/confd
### PHP EXTENSIONS
RUN pecl install redis
RUN docker-php-ext-install pdo pdo_pgsql bcmath
RUN docker-php-ext-enable redis
RUN chmod +x /usr/local/bin/confd


RUN mkdir -p /opt/confd/bin && \
    mkdir -p /var/lib/nginx && \
    mkdir -p /var/lib/nginx/tmp && \
    mkdir -p /run/nginx




COPY ./docker/app/etc/supervisor.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./docker/app/etc/confd /etc/confd
COPY ./docker/app/etc/entrypoint.sh /usr/local/bin/entrypoint.sh


COPY ./src/app /app
WORKDIR /app


RUN apk del build-dependecies
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

ENTRYPOINT sh /usr/local/bin/entrypoint.sh