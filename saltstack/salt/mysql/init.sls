Install mysql and run the service:
  pkg.installed:
    - name: mysql-server
  service.running:
    - name: mysql
    - enable: True
    
python-mysqldb:
  pkg.installed

{% set db_config = pillar.get('mysql-server', {}) %}
# create databases
mysql_database_{{ db_config['database_name'] }}:
  mysql_database.present:
    - name: {{ db_config['database_name'] }}
    - require:
      - pkg: python-mysqldb
      - service: mysql

# create database users
mysql_users_{{ db_config['database_name'] }}:
  mysql_user.present:
    - name: {{ db_config['user'] }}
    - host: localhost
    - password:  {{ db_config['password'] }}
    - require:
      - pkg: python-mysqldb
      - service: mysql

# create database permissions
mysql_grants_{{ db_config['database_name'] }}:
  mysql_grants.present:
    - grant: all
    - database: {{ db_config['database_name'] }}.*
    - user: {{ db_config['user'] }}
    - host: localhost
