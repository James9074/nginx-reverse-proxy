#!/usr/bin/env bash

# This lets us write our conf file with ${env_vars} without affecting $nginx_vars
export DOLLAR='$'
envsubst < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
nginx -g "daemon off;"
