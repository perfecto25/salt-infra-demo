# STATE - create users from Pillar data


## create users
{% for user, args in salt['pillar.get']('users',{}).iteritems() %}

{{ user }}:

    {% if args.status == 'present' %}
    group.present:
        - gid: {{ args.uid }}

    user.present:
        - fullname: {{ args.fullname }}
        - uid: {{ args.uid }}
        - gid: {{ args.uid }}
    
        {% if 'shell' in args %}
        - shell: {{ args.shell }}
        {% endif %}

        {% if 'home' in args %}
        - home: {{ args.home }}
        {% endif %}

        {% if 'groups' in args %}
        - groups: {{ args.groups }}
        {% endif %}

    ## Manage SSH Keys
    {% if 'ssh_keys' in args %}
    ssh_auth.present:
        - user: {{ user }}
        - names:  
        {% for key in args.ssh_keys %}
            - {{ key }}
        {% endfor %}
    {% endif %}

    {% endif %} # if status=present


    ## Remove User if absent
    {% if args.status == 'absent' %}
    user.absent: []
    group.absent: []
    
    ### remove Home Dir
    {% if 'home' in args %}
    file.absent:
        - name: {{ args.home }}
    {% endif %}

    {% endif %} # if status=absent


## Manage .bashrc
{% if 'home' in args and args.status == 'present' %}
bashrc_{{ user }}:
   file.managed:
     - name: {{ args.home }}/.bashrc
     - user: {{ user }}
     - group: {{ user }}
     - mode: 644
     - source: salt://users/files/bashrc
{% endif %}

{% endfor %}