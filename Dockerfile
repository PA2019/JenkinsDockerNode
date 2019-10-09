# using this node base image
#FROM node:7-onbuild

FROM richarvey/nginx-php-fpm

# set maintainer
LABEL maintainer "test@qwedsa.com"

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:80 || exit 1

# docker to expose this port to the world
EXPOSE 80

# ENTRYPOINT ["node", "main.js"]
