# Usando imagem base PHP com FPM
FROM php:8.2-fpm

# Instalar dependências do sistema e extensões PHP
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libonig-dev \
    zip \
    unzip \
    git \
    curl && \
    docker-php-ext-install pdo pdo_mysql

# Copiar o Composer da imagem oficial
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Definir o diretório de trabalho
WORKDIR /var/www/html

# Copiar o código-fonte para o contêiner
COPY . .

# Instalar dependências do Composer
RUN composer install

# Definir o comando de inicialização do contêiner
CMD ["php-fpm"]
