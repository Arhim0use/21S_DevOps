FROM nginx:stable

RUN apt update && apt install -y\
    gcc \
    spawn-fcgi \
    libfcgi0ldbl \
    libfcgi-dev


COPY nginx/nginx.conf /etc/nginx
COPY hello_world.c /home/

EXPOSE 81

ENTRYPOINT ["sh", "-c", \
    "gcc /home/hello_world.c -o /home/hello_world -lfcgi && \
     spawn-fcgi -p 8080 /home/hello_world && \
     nginx -g 'daemon off;'"]

