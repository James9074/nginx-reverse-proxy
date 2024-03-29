# Nginx Reverse Proxy
![nginx-latest](https://img.shields.io/badge/nginx-latest-brightgreen.svg) ![mit](https://img.shields.io/badge/license-MIT-blue.svg)

This is a super simple nginx setup that is pre-configured to allow for a simple reverse-proxy setup without the need for target services to be running in linked containers.


## Usage

Just drop this in place of `nginx` and set the following:
* Env `NGINX_PORT` - The host listening port
* Env `NGINX_HOST` - The target service you want to reverse-proxy to

**Sample `docker-compose.yml` - This will reverse-proxy `http://192.168.0.100:3000` on the host's port `8080`:**
```YAML
version: '2'
services:
  nginx:
    image: james9074/nginx-reverse-proxy
    environment:
      NGINX_PORT: '8080'
      NGINX_HOST: http://192.168.0.100:3000
    stdin_open: true
    tty: true
```

If you need to extend the nginx conf you can volume mount your own like so (copy the one from this repo first):
```YAML
    volumes:
        - ./default.conf.template:/etc/nginx/conf.d/default.conf.template
```

