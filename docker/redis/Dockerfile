ARG ALPINE_VERSION="3.12"

FROM alpine:${ALPINE_VERSION}

RUN addgroup -g 1000 -S redis && adduser -u 1000 -S redis -G redis && \
    apk add --no-cache redis 

EXPOSE 6379

USER redis

CMD ["redis-server", "--protected-mode no"]

HEALTHCHECK CMD nc -w 1 localhost 6379 || exit 1