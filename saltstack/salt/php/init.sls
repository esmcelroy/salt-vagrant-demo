# Install PHP and extensions
libmysqlclient20:
  pkg.installed

mysql-common:
  pkg.installed

php:
  pkg.installed:
    - pkgs:
      - php7.0
      - php-dev
      - php-cli
      - php-curl
      - php-gd
      - php-gmp
      - php-imagick
      - php-intl
      - php-mcrypt
      - php-memcache
      - php-mysql
{% if 'dev' in grains.roles %}
      - php-xdebug
{% endif %}

include:
  - .extensions

