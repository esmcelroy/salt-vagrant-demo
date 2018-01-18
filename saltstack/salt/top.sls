base:
  '*':
    - common
    - openssh

  'roles:wordpress':
    - match: grain
    - php
    - mysql
    - apache
    - wordpress