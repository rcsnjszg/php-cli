FROM php:8.0.20-cli-alpine

RUN apk add --no-cache bash

WORKDIR /app

ENTRYPOINT ["php"]
