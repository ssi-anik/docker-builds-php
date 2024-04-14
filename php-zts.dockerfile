# syntax = edrevo/dockerfile-plus
ARG BASE_IMAGE="php:8.3-zts"
FROM ${BASE_IMAGE}

INCLUDE+ ./includes/basic.dockerfile
INCLUDE+ ./includes/supervisor.dockerfile

COPY ./php-zts-entrypoint.sh /php-zts-entrypoint

RUN chmod +x /php-zts-entrypoint

ENTRYPOINT ["/php-zts-entrypoint"]
