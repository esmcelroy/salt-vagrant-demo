users:
  group.present

Eric's user account:
  user.present:
    - name: eric
    - shell: /bin/bash
    - home: /home/eric
    - groups:
      - users
      - sudo


      


