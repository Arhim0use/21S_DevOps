#!/bin/bash

docker stop nginx_6 
docker run -d --rm --name nginx_6 -v ./nginx:/etc/nginx -p 80:8080 nginx:stable
docker ps



