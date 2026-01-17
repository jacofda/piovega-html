#!/bin/bash

DOMAIN="fattoriapiovega.it"
EMAIL="giacomo.gasperini@gmail.com"

echo "Avvio nginx temporaneamente..."
docker-compose up -d web

echo "Richiesta certificato Let's Encrypt per $DOMAIN..."
docker-compose run --rm certbot certonly --webroot \
    --webroot-path=/usr/share/nginx/html \
    --email $EMAIL \
    --agree-tos \
    --no-eff-email \
    -d $DOMAIN

echo "Riavvio nginx con SSL..."
docker-compose restart web

echo "Fatto! Il certificato verrà rinnovato automaticamente."