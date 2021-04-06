FROM nginx
COPY ssl_passwords /var/run/nginx/ssl_passwords
RUN chmod 600 /var/run/nginx/ssl_passwords