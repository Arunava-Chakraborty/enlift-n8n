FROM n8nio/n8n:latest

# Install curl using Alpine package manager
USER root
RUN apk update && apk add --no-cache \
    curl \
    && rm -rf /var/cache/apk/*

USER node

# Health check using curl
HEALTHCHECK --interval=30s --timeout=10s --start-period=120s --retries=3 \
    CMD curl -f http://localhost:5678/healthz || exit 1

EXPOSE 5678