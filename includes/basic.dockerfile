# Install dependencies
RUN apt-get update \
    && apt-get install --no-install-recommends -y curl nano vim less jq git zip unzip zlib1g-dev \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install https://github.com/mlocati/docker-php-extension-installer
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# ext imagick not available for 8.3 https://github.com/mlocati/docker-php-extension-installer?tab=readme-ov-file#supported-php-extensions
RUN chmod +x /usr/local/bin/install-php-extensions \
    && install-php-extensions pdo pdo_pgsql pdo_mysql bcmath redis sockets pcntl \
        intl zip gmp gd @composer

# Copy default ini config
COPY ./conf/php/custom.ini /usr/local/etc/php/conf.d/custom.ini

RUN mkdir -p /var/www/html

WORKDIR /var/www/html
