
# STATE: Webserver Profile

nginx:
    user.present:
        - fullname: Nginx Service Account
        - uid: 1200
        - gid: 1200

    pkg.installed:
        - version: latest
