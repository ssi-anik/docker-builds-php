# Install nginx
RUN apt-get update && apt-get install -y nginx

# Copy nginx config
COPY ./conf/nginx/default.conf /etc/nginx/sites-enabled/default

# Run nginx in supervisor
COPY ./conf/supervisord/nginx-fpm.conf /etc/supervisor/conf.d/nginx-fpm.conf

# disable stdout for php-fpm access.log
RUN sed -i -e 's/access.log = .*/access.log = \/dev\/null/' /usr/local/etc/php-fpm.d/docker.conf

# Forward all logs to std*
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 9000
