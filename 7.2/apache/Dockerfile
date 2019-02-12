FROM mileschou/phalcon:7.2-apache

LABEL maintainer="Richard Browne <github.com/rabrowne85>"

# Enable mod_rewrite and PDO MySQL
RUN a2enmod rewrite \
    && apt-get update && apt-get install -y libmemcached-dev zlib1g-dev libzip-dev

RUN pecl install memcached \
    && docker-php-ext-enable memcached

RUN docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    && service apache2 restart

RUN curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar && \
    cp phpcs.phar /usr/local/bin/phpcs && \
    chmod +x /usr/local/bin/phpcs
