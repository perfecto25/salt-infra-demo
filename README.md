# Saltstack Basic Infrastructure - config demonstration

Shows how to setup a basic config management layout

includes:
1. pillar data setup for Users, Packages, Groups
1. salt state configuration that uses Pillar data to enforce config management on servers

## how to use
All servers are configured per-individual Role 
```
/srv/pillar/servers
```
Each server includes pillar data, and also a Role its assigned to, for example Default, or Webserver

Salt States do the actual cruching of Pillar data and install packages, create users, modify files, etc

---

This is a basic demonstration of usage of Pillar data structures and how to write out your infrastructure as code.