FROM nginx:alpine

# Copia la configurazione nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copia i file del sito
COPY ./site /usr/share/nginx/html

EXPOSE 80