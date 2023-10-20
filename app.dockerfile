FROM php:8.2-fpm

ARG WITH_XDEBUG=true

RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libjpeg-dev \
    libwebp-dev \
    --no-install-recommends \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure -j$(nproc) gd \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install intl \
    && docker-php-ext-install pdo pdo_mysql; \
    if [ $WITH_XDEBUG = "true" ] ; then \
       pecl install xdebug; \
    fi;
