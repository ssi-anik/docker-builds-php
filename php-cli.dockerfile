# syntax = edrevo/dockerfile-plus
ARG BASE_IMAGE="php:8.3-cli"
FROM ${BASE_IMAGE}

INCLUDE+ ./includes/basic.dockerfile
INCLUDE+ ./includes/supervisor.dockerfile

COPY ./php-cli-entrypoint.sh /php-cli-entrypoint

RUN chmod +x /php-cli-entrypoint

ENTRYPOINT ["/php-cli-entrypoint"]
