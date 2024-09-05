#!/bin/bash

docker stop parth_5 
docker rmi fg/parth_5:1.0

# export DOCKER_CONTENT_TRUST=1

docker build . --tag fg/parth_5:1.0 --file Dockerfile 
docker images
docker run -d --rm --name parth_5 -v $(pwd)/nginx:/etc/nginx -p 80:81 fg/parth_5:1.0

# docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock goodwithtech/dockle --ignore CIS-DI-0010 -ak NGINX_GPGKEY fg/parth_5:1.0

