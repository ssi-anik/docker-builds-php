#!/bin/sh
set -e

service nginx restart
php-fpm
