#!/bin/bash

docker stop parth_4 
docker rmi fg/parth_4 
docker build . --tag fg/parth_4 --file Dockerfile 
docker images
docker run -d --rm --name parth_4 -v $(pwd)/nginx:/etc/nginx -p 80:81 fg/parth_4
# cd