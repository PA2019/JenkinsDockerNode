# using this node base image
FROM richarvey/nginx-php-fpm
#FROM node:7-onbuild

# set maintainer
LABEL maintainer "test@qwedsa.com"

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:80 || exit 1

# docker to expose this port to the world
EXPOSE 80
#EXPOSE 8000

# ENTRYPOINT ["node", "main.js"]
