FROM nginx:stable

COPY nginx/nginx.conf /etc/nginx
COPY run.sh /entrypoint/run.sh

RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /etc/nginx/nginx.conf && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/run/nginx.pid && \
    chown -R nginx:nginx /entrypoint && \
    chmod +x /entrypoint/run.sh

USER nginx


ENTRYPOINT [ "bash", "/entrypoint/run.sh" ]


