# STATE - create groups from Pillar data


## create group
{% for group, args in salt['pillar.get']('groups',{}).iteritems() %}

{{ group }}:
  group.present:
    - gid: {{ args.gid }}

{% endfor %}

## Add groups to SUDOERS
/etc/sudoers.d/custom_sudo:
    file.managed:
        - source: salt://groups/files/custom_sudo
        - user: root
        - group: root
        - mode: 440