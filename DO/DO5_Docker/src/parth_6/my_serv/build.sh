#!/bin/bash

docker stop parth_5 
docker rmi fg/parth_5:1.0
docker build . --tag fg/parth_5:1.0 --file Dockerfile 
docker images



