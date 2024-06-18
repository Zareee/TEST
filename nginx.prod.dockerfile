FROM nginx:stable-alpine

ENV NGINXUSER=zare
ENV NGINXGROUP=zare

RUN mkdir -p /var/www/html/public

ADD nginx/default.prod.conf /etc/nginx/conf.d/default.conf
ADD nginx/laravel_app.pem /etc/nginx/certs/laravel_app.pem
ADD nginx/laravel_app-key.pem /etc/nginx/certs/laravel_app-key.pem

RUN sed -i "s/user www-data/user ${NGINXUSER}/g" /etc/nginx/nginx.conf

RUN adduser -g ${NGINXGROUP} -s /bin/sh -D ${NGINXUSER}