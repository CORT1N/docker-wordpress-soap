FROM wordpress:7.1.4-php8.5-fpm-alpine

# hadolint ignore=DL3018,SC2086
RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS libxml2-dev=2.13.9-r2 \
    && docker-php-ext-install soap \
    && apk del .build-deps \
    && apk add --no-cache libxml2=2.13.9-r2
