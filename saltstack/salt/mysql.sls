Install mysql and run the service:
  pkg.installed:
    - name: mysql
  service.running:
    - name: mysql
    - enable: True
    
