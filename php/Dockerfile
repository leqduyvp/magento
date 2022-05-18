FROM php:7.3-fpm

WORKDIR /var/www/html/magento2 

RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libicu-dev \
    libxml2-dev \
    libxslt-dev \
    libzip-dev \
    git vim unzip cron \
    --no-install-recommends \
    && rm -r /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-jpeg-dir=/usr/lib \
    --with-freetype-dir=/usr/include/freetype2 \
    && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-configure intl \
    && docker-php-ext-install -j$(nproc) intl

RUN docker-php-ext-install -j$(nproc) opcache bcmath pdo_mysql soap xsl zip sockets

RUN apt install curl git

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer self-update 1.10.26
# RUN composer install

RUN cp "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"
ADD ./php-custom.ini $PHP_INI_DIR/conf.d/
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

RUN mkdir ./magento-sample-data
COPY ./magento2-sample-data-2.4.0/ ./magento-sample-data/

ENTRYPOINT ["/entrypoint.sh"]
# ENTRYPOINT ["sh", "setup.sh" ]

# RUN useradd -m -s /bin/bash magento && usermod -a -G www-data magento

# RUN cp "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# ADD ./php-custom.ini $PHP_INI_DIR/conf.d/
