#!/bin/bash
cd "$(dirname "$0")" || exit 1
mkdir -p ./cf-admin
sudo chown 65532:65532 ./cf-admin
read -p "Enter your hostname: " hostname
sed "s|ssh.example.com|$hostname|g" config_orig.yml > config.yml
docker run --rm -it -v ./cf-admin:/home/nonroot/.cloudflared cloudflare/cloudflared:latest tunnel login
docker run --rm -it -v ./cf-admin:/home/nonroot/.cloudflared cloudflare/cloudflared:latest tunnel create ssh-edge
docker run --rm -it -v ./cf-admin:/home/nonroot/.cloudflared cloudflare/cloudflared:latest tunnel route dns ssh-edge $hostname
sudo mv $(find ./cf-admin -type f -name "*.json") ./tunnel.json
sudo rm -r ./cf-admin
