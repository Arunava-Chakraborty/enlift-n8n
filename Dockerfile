FROM n8nio/n8n:latest

# Install system dependencies
USER root
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean
USER node

# Create custom config directory with proper permissions
RUN mkdir -p /home/node/.n8n/config && \
    chmod 700 /home/node/.n8n/config

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=120s --retries=3 \
    CMD curl -f http://localhost:5678/healthz || exit 1

EXPOSE 5678