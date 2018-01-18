/var/www/html/wp-config.php:
  file.managed:
  - source: salt://wordpress/files/wp-config.php
  - template: jinja

/var/www/html/.htaccess:
  file.managed:
  - source: salt://wordpress/files/.htaccess
  - mode: 777

/var/www/html/cluster.html:
  file.managed:
  - source: salt://wordpress/files/cluster.html
  - template: jinja
