#!bin/bash

spawn-fcgi -p 8080 /serv/hello_world 
nginx -t
nginx -s reload
nginx -g 'daemon off;'