# PILLAR: Minion1

{# include:
   # - common.users
    - common.packages
   # - users.mreider
  #  - profile.webserver #}


## set specific per-node configurations
role: webserver
packages:
    htop:
        version: '2.0.1*'