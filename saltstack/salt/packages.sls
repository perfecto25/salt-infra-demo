
# STATE: packages

{% for pkg_name, pkg_details in salt['pillar.get']('packages', {}).iteritems() %}

{{ pkg_name }}:
  pkg:
    - {{ pkg_details.pkg }}

    {% if pkg_details.version is defined %}
    - version: {{ pkg_details.version }}
    {% endif %}

{% endfor %}

