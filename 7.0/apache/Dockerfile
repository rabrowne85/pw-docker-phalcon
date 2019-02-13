FROM mileschou/phalcon:7.0-apache

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

RUN docker-phalcon-install-devtools \
    && phalcon

RUN curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar && \
    cp phpcbf.phar /usr/local/bin/phpcbf && \
    chmod +x /usr/local/bin/phpcbf

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

RUN apt-get install -y gnupg2 \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs
