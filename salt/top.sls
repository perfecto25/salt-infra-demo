
# STATE: Top

base:
  '*':
    - role.{{ salt['pillar.get']('role', 'default') }}
