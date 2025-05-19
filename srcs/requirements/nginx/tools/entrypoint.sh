#!/bin/bash

echo "Waiting for WordPress to be ready..."
until nc -z wordpress 9000; do
    echo "WordPress is not ready yet. Waiting..."
    sleep 3
done
echo "WordPress is ready!"

echo "NGINX Starting"
nginx -g "daemon off;"
