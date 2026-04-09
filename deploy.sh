#!/bin/bash

# Deploy all AJIZ CTF challenges

echo "Deploying AJIZ CTF challenges..."

# Create traefik network if it doesn't exist
if ! docker network ls | grep -q "traefik"; then
    echo "Creating traefik network..."
    docker network create traefik
fi

# Deploy traefik
echo "Deploying Traefik..."
cd challenges/traefik && docker compose up -d

# Deploy all challenges
echo "Deploying challenges..."
for d in ./challenges/*/; do
    if [ -f "$d/compose.yml" ] && [ "$(basename "$d")" != "traefik" ]; then
        challenge_name=$(basename "$d")
        echo "Deploying $challenge_name..."
        cd "$d" && docker compose up -d
        cd - > /dev/null
    fi
done

echo "Deployment complete!"
echo "Challenges should be accessible at:"
echo "  http://brouklou.cyber-night.tech"
echo "  http://sqli.cyber-night.tech"
echo "  http://xss.cyber-night.tech"
echo "  http://jail.cyber-night.tech"
echo "  http://livrirly4.cyber-night.tech"
echo "  http://sleeperagents.cyber-night.tech"
echo "  http://livrily2.cyber-night.tech"
echo "  http://firstbloodbot.cyber-night.tech"