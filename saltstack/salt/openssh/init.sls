{% from "openssh/map.jinja" import openssh with context %}

openssh:
  {% if openssh.server is defined %}
  pkg.installed:
    - name: {{ openssh.server }}
  {% endif %}
  service.running:
    - enable: True
    - name: {{ openssh.service }}
  {% if openssh.server is defined %}
    - require:
      - pkg: {{ openssh.server }}
  {% endif %}

sshd_config:
  file.managed:
    - name: {{ openssh.sshd_config }}
    - source: {{ openssh.sshd_config_src }}
    - template: jinja
    - user: root
    - mode: 600
    - watch_in:
      - service: openssh
