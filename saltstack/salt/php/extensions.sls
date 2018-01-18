php-pear:
  pkg.installed:
    - require:
      - pkg: php

{% if 'dev' in grains.roles %}
/etc/php/7.0/cli/conf.d/xdebug.ini:
  file.managed:
    - source: salt://php/files/xdebug.ini
    - user: root
    - group: root
    - mode: 644
{% endif %}

/etc/php/7.0/cli/conf.d/20-xdebug.ini:
  file.absent

# Install Zend OpCache extension - as it's not yet stable, we have to explicityly specify version number
zendopcache:
  pecl.installed:
    - version: 7.0.3
    - require: 
      - pkg: php-pear

/etc/php/7.0/cli/conf.d/opcache.ini:
  file.managed:
    - source: salt://php/files/opcache.ini
    - template: jinja
    - user: root
    - group: root
    - mode: 644
