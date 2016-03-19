FROM debian:8

RUN apt-get update && apt-get install -y --force-yes \
    build-essential \
    curl \
    less

RUN apt-get update && export DEBIAN_FRONTEND="noninteractive" && apt-get install -y --force-yes \
    mysql-server \
    php5 \
    php5-curl \
    php5-mysql \
    php5-xdebug

RUN apt-get update && apt-get install -y --force-yes git python-pip graphviz && \
    pip install sphinx sphinx_rtd_theme

RUN apt-get autoremove --purge -y && apt-get clean

RUN curl https://getcomposer.org/download/1.0.0-alpha11/composer.phar -o /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer

RUN curl https://phar.phpunit.de/phpunit-5.2.9.phar -o /usr/local/bin/phpunit && \
    chmod +x /usr/local/bin/phpunit

RUN curl http://get.sensiolabs.org/sami.phar -o /usr/local/bin/sami && \
    chmod +x /usr/local/bin/sami

RUN curl http://get.sensiolabs.org/php-cs-fixer.phar -o /usr/local/bin/php-cs-fixer && \
    chmod +x /usr/local/bin/php-cs-fixer

RUN mkdir -p /root/api/

WORKDIR /root/api/
