FROM caddy/caddy:2-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-auth-jwt \
    --with github.com/greenpau/caddy-auth-portal

FROM caddy/caddy:2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
