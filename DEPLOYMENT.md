# Deployment Information

## Server Location
- **Directory**: `/var/www/fattoriapiovega.it`
- **User**: `deploy`
- **Server IP**: 57.131.21.39

## Architecture
The site uses a reverse proxy setup to allow multiple sites on the same server:

- **reverse-proxy**: Main nginx container handling ports 80/443
  - Routes `fattoriapiovega.it` → `fattoriapiovega` container
  - Routes other domains → other containers
  
- **fattoriapiovega**: Your site container (nginx)
  - Serves site on internal port 80
  - Accessible only through reverse proxy

- **certbot**: SSL certificate management
  - Renews certificates every 12 hours
  - Automatically reloads nginx after renewal

## SSL Certificates
- Stored in Docker volume: `fattoriapiovega_certbot-etc`
- Auto-renewal enabled
- Expires: 2026-04-18

## Deployment
Use GitHub Actions or run:
```bash
cd /var/www/fattoriapiovega.it
docker compose -f docker-compose.proxy.yml up -d --build
```

## URLs
- http://fattoriapiovega.it → redirects to https://fattoriapiovega.it
- http://www.fattoriapiovega.it → redirects to https://www.fattoriapiovega.it  
- https://fattoriapiovega.it → works
- https://www.fattoriapiovega.it → works
