#!/bin/bash

sudo apt-get update
sudo apt-get install -y haproxy
sudo cp /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.bak
sudo cat <<EOT >> /etc/haproxy/haproxy.cfg
frontend http-in
    bind *:80
    default_backend servers

backend servers
    balance roundrobin
    server web1 192.168.56.10:80 check
    server web2 192.168.56.11:80 check
EOT

sudo service haproxy restart
