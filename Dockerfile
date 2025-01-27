# Dockerfile
FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    libpq-dev \
    libonig-dev \
    zip \
    unzip \
    git \
    curl \

RUN docker-php-ext-install pdo pdo_mysql

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

COPY . .

RUN composer install

CMD ["php-fpm"]
