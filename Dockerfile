FROM php:8.2-cli-alpine3.17

RUN apk add --no-cache bash

WORKDIR /app

ENTRYPOINT ["php"]
