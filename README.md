# Cloudflare SSH

Hosting SSH through Cloudflare tunnel host-side, automated

## Requirements
* [Cloudflare](https://dash.cloudflare.com) account and domain
* A Linux machine (sudo permission)
* Docker installed with [docker-compose-plugin](https://docs.docker.com/compose/install/linux/)

## Usage

1. Run `setup.sh` once. If prompted, enter your domain to host the tunnel. Follow the instructions shown afterwards. This will setup a tunnel on your Cloudflare account. If you already have a valid tunnel.json, you do not have to run this again.
2. Run `run.sh` to start your tunnel.

If your tunnel is down, you can always run `run.sh` to restart. If you want to stop it, run `stop.sh`

## Notes

You do not need to open SSH port to public when using Cloudflare tunnel. If you are hosting a VM, I recommend blocking the SSH port from public on the networking settings of your cloud provider unless necessary.