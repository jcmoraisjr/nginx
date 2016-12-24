#nginx

A nginx's Docker image as small as Alpine Linux + apk add nginx.

All logging messages are sent to stdout.

[![Docker Repository on Quay](https://quay.io/repository/jcmoraisjr/nginx/status "Docker Repository on Quay")](https://quay.io/repository/jcmoraisjr/nginx)

#Usage

Mount the root site on `/var/lib/nginx/html`:

    docker run -d --name nginx -p 80:80 -v ${PWD}:/var/lib/nginx/html quay.io/jcmoraisjr/nginx

#Deploy

Use local `/var/www/html` directory as the root site:

    [Unit]
    Description=Nginx
    After=docker.service
    Requires=docker.service
    [Service]
    ExecStartPre=-/usr/bin/docker stop nginx
    ExecStartPre=-/usr/bin/docker rm nginx
    ExecStart=/usr/bin/docker run \
      --name nginx \
      -p 80:80 \
      -v /var/www/html:/var/lib/nginx/html:ro \
      quay.io/jcmoraisjr/nginx:latest
    ExecStop=-/usr/bin/docker stop nginx
    RestartSec=10s
    Restart=always
    [Install]
    WantedBy=multi-user.target
