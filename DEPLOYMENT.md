# Deployment Information

## Server Location
- **Directory**: `/var/www/fattoriapiovega.it`
- **User**: `deploy`
- **Server IP**: 57.131.21.39

## Architecture
The site uses a reverse proxy setup to allow multiple sites on the same server:

- **reverse-proxy**: Main nginx container handling port 80
  - Routes `fattoriapiovega.it` → `fattoriapiovega` container
  - Routes other domains → other containers
  
- **fattoriapiovega**: Your site container (nginx)
  - Serves site on internal port 80
  - Accessible only through reverse proxy

## Deployment
Use GitHub Actions or run:
```bash
cd /var/www/fattoriapiovega.it
docker compose -f docker-compose.proxy.yml up -d --build
```

## URLs
- http://fattoriapiovega.it
- http://www.fattoriapiovega.it
