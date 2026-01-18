#!/bin/bash
set -e

echo "Setting up SSL certificates for fattoriapiovega.it..."

# Obtain SSL certificates
docker compose -f ~/fattoriapiovega/docker-compose.proxy.yml run --rm certbot certonly \
  --webroot \
  --webroot-path=/usr/share/nginx/html \
  -d fattoriapiovega.it \
  -d www.fattoriapiovega.it \
  --email giacomogasperini@gmail.com \
  --agree-tos \
  --no-eff-email

echo "SSL certificates obtained successfully!"
echo "Restarting reverse proxy with HTTPS enabled..."

# Restart reverse proxy to load the certificates
docker compose -f ~/fattoriapiovega/docker-compose.proxy.yml restart reverse-proxy

echo "Done! Your site should now be accessible via HTTPS"
