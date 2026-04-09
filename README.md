# AJIZ CTF Challenges Deployment

This repository contains the deployment configuration for the AJIZ CTF challenges.

## Structure

Each challenge has its own directory with:
- `docker-compose.yml` - Deployment configuration
- `.env` - Environment variables (to be created/secrets managed separately)

## Deployment

1. Ensure all challenge images are built and pushed:
   ```bash
   # From the challenges directory
   python3 build.py adamab --push
   ```

2. Deploy all challenges:
   ```bash
   ./deploy.sh
   ```

3. Or deploy individual challenges:
   ```bash
   cd challenges/brouklou && docker compose up -d
   ```

## Available Challenges

- brouklou - Web inspection challenge
- XSS - Cross-site scripting challenge
- sqli - SQL injection challenge
- ctfJail - Command jail escape challenge
- livrirly4 - Advanced web challenge
- SleeperAgents - Web application challenge
- FirstBloodBot - Bot/misc challenge
- Livrily2 - Authentication challenge

## Infrastructure

- Traefik reverse proxy for automatic SSL and routing
- Each challenge exposed via subdomain: `challenge-name.cyber-night.tech`