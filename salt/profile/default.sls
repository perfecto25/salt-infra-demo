# STATE - Default Profile


include:
  - groups
  - users


## install common packages
{% for package in salt['pillar.get']('packages') %}
{{ package }}:
  pkg.installed
{% endfor %}
