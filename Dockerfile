FROM nginx:alpine

# Copia la configurazione nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copia i file del sito
COPY ./site /usr/share/nginx/html

# Crea directory per Let's Encrypt
RUN mkdir -p /usr/share/nginx/html/.well-known/acme-challenge

EXPOSE 80