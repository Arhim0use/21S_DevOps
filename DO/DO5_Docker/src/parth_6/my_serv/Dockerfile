FROM gcc:11.4 AS builder

WORKDIR /home/

COPY hello_world.c ./

RUN apt update && apt install -y \
    spawn-fcgi \
    libfcgi0ldbl \
    libfcgi-dev && \
    rm -rf /var/lib/apt/lists && \
    gcc hello_world.c -o hello_world -lfcgi

FROM nginx:stable

WORKDIR /serv

COPY --from=builder /home/hello_world /serv/hello_world
COPY nginx/nginx.conf /etc/nginx
COPY run.sh /entrypoint/run.sh

RUN apt update && apt install -y\
    spawn-fcgi  \
    libfcgi0ldbl  \
    libfcgi-dev && \
    rm -rf /var/lib/apt/lists 

RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /etc/nginx/nginx.conf && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /entrypoint && \
    chown -R nginx:nginx /serv && \
    chown -R nginx:nginx /var/run/nginx.pid && \
    \
    chmod +x /entrypoint/run.sh && \
    chmod +x /serv/hello_world && \
    chmod u-s /usr/bin/mount && \
    chmod u-s /usr/bin/umount && \
    chmod g-s /usr/bin/expiry && \
    chmod u-s /usr/bin/newgrp && \
    chmod u-s /usr/bin/chfn && \
    chmod g-s /usr/bin/chage && \
    chmod u-s /usr/bin/su && \
    chmod u-s /usr/bin/chsh && \
    chmod u-s /usr/bin/gpasswd && \
    chmod g-s /usr/sbin/unix_chkpwd && \
    chmod u-s /usr/bin/passwd 

USER nginx

HEALTHCHECK --interval=30s --timeout=5s --retries=5 CMD curl -f http://localhost/ || exit 1

ENTRYPOINT [ "bash", "/entrypoint/run.sh" ]


