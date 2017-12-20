configure MOTD:
  pkg.installed:
    - name: fortune-mod
    - name: tclsh
  file.managed:
    - name: /etc/motd.tcl
    - source: salt://motd/files/motd.tcl
    - permissions: 777

update profile:
  file.managed:
    - name: /etc/profile
    - source: salt://motd/files/profile
    - permissions: 644
