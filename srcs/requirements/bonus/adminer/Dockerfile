FROM alpine:3.20

ARG PHP_VERSION=83

RUN apk update && apk upgrade && apk add --no-cache php php-fpm php-mysqli php-json php-curl php-dom php-exif php-fileinfo php-mbstring php-openssl php-xml php-zip php-pecl-redis wget unzip

WORKDIR /var/www

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
    mv adminer-4.8.1.php index.php && \
    chown -R root:root /var/www/

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www"]
