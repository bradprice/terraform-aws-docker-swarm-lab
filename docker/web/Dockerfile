ARG ALPINE_VERSION=3.12
ARG NEXTCLOUD_VER=19.0.0

FROM alpine:${ALPINE_VERSION}

COPY nginx.conf /etc/nginx/nginx.conf

RUN apk add --no-cache curl openssl ca-certificates && \
    echo "http://nginx.org/packages/mainline/alpine/v${ALPINE_VERSION}/main" >> /etc/apk/repositories && \
    curl -#o /etc/apk/keys/nginx_signing.rsa.pub https://nginx.org/keys/nginx_signing.rsa.pub && \
    apk add --no-cache nginx && \
    rm /etc/nginx/conf.d/default.conf && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

VOLUME [ "/var/www/html" ]

CMD ["nginx", "-g", "pid /tmp/nginx.pid; daemon off;"]

#HEALTHCHECK CMD curl --fail http://localhost/ || exit 1