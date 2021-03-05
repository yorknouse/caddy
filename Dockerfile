FROM caddy:lastest-builder AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-auth-jwt \
    --with github.com/greenpau/caddy-auth-portal \
    --with github.com/greenpau/caddy-trace

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
