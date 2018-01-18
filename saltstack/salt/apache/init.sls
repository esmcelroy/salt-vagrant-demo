{% from "apache/map.jinja" import apache with context %}

apache:
  pkg.installed:
    - name: {{ apache.server }}
  service.running:
    - name: {{ apache.service }}
    - enable: True

# The following states are inert by default and can be used by other states to
# trigger a restart or reload as needed.
apache-reload:
  module.wait:
    - name: service.reload
    - m_name: {{ apache.service }}

apache-restart:
  module.wait:
    - name: service.restart
    - m_name: {{ apache.service }}

libapache2-mod-php7.0:
  pkg:
    - installed
    - require_in:
    - service: apache2
  cmd:
    - run
    - name: a2enmod php7.0 rewrite
    - require:
      - pkg: libapache2-mod-php7.0

/var/www/html/index.html:
  file.absent