FROM php:7.2-fpm
WORKDIR /var/www/html
RUN apt update \
    && apt-get install nginx -y \
    && docker-php-ext-install pdo_mysql mysqli
RUN rm -rf *
COPY media-sosial/ .
COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
