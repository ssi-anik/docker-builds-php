# syntax = edrevo/dockerfile-plus
ARG BASE_IMAGE="php:8.3-fpm"
FROM ${BASE_IMAGE}

INCLUDE+ ./includes/basic.dockerfile

RUN apt-get update \
    && apt-get install --no-install-recommends -y nginx \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && rm -rf /var/www/html/index.nginx-debian.html

COPY ./conf/nginx/default.conf /etc/nginx/sites-enabled/default

# disable stdout for php-fpm access.log
RUN sed -i -e 's/access.log = .*/access.log = \/dev\/null/' /usr/local/etc/php-fpm.d/docker.conf

# Forward all logs to std*
#RUN ln -sf /dev/stdout /var/log/nginx/access.log \
#    && ln -sf /dev/stderr /var/log/nginx/error.log \
#    && rm -rf /var/www/html/index.nginx-debian.html

COPY ./php-fpm-entrypoint.sh /php-fpm-entrypoint

RUN chmod +x /php-fpm-entrypoint

ENTRYPOINT ["/php-fpm-entrypoint"]

EXPOSE 80
