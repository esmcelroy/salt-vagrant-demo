download-wordpress:
  cmd.run:
    - cwd: /tmp
    - name: wget -q http://wordpress.org/latest.tar.gz
    - unless: test -f /tmp/latest.tar.gz

unpack-wordpress:
  cmd.run:
  - cwd: /tmp
  - require:
    - cmd: download-wordpress
  - name: tar zxf latest.tar.gz
  - unless: test -d /tmp/wordpress

copy-wordpress-to-doc-root:
  cmd.run:
  - name: cp -R /tmp/wordpress/* /var/www/html
  - require:
    - cmd: download-wordpress
    - cmd: unpack-wordpress
  - unless: test -f /var/www/html/wp-login.php
