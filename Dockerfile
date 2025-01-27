# Dockerfile
FROM php:8.2-fpm

# Instala dependências do sistema
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libonig-dev \
    zip \
    unzip \
    git \
    curl

# Instala extensões PHP
RUN docker-php-ext-install pdo pdo_mysql

# Instala Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Define o diretório de trabalho
WORKDIR /var/www/html

# Copia o código da aplicação
COPY . .

# Permissões e instalação
RUN composer install

# Define o comando padrão
CMD ["php-fpm"]
