{% set site_details = pillar.get('wordpress-conf', {}) %}

complete-wordpress-setup:
  cmd.run:
    - name: >-
        curl "http://localhost/wp-admin/install.php?step=2" 
        --data-urlencode "weblog_title={{ site_details['blog_title'] }}" 
        --data-urlencode "user_name={{ site_details['user_name'] }}" 
        --data-urlencode "admin_email={{ site_details['admin_email'] }}" 
        --data-urlencode "admin_password={{ site_details['admin_password'] }}" 
        --data-urlencode "admin_password2={{ site_details['admin_password'] }}" 
        --data-urlencode "pw_weak=1"