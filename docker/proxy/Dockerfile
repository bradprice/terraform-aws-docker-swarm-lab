FROM alpine:3.12

ARG TRAEFIK_VERSION="2.2.5"

COPY entrypoint.sh /

RUN apk add --no-cache curl && \
	curl -sL https://github.com/containous/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_v${TRAEFIK_VERSION}_linux_amd64.tar.gz -o /tmp/traefik.tar.gz && \
	tar xzvf /tmp/traefik.tar.gz -C /usr/local/bin traefik && \
	rm -f /tmp/traefik.tar.gz && \
	chmod +x /usr/local/bin/traefik entrypoint.sh
	

EXPOSE 80
EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
CMD ["traefik"]

HEALTHCHECK CMD curl --fail http://localhost:8080 || exit 1