# Use official n8n image
FROM n8nio/n8n:latest

# Install any additional packages if needed
# RUN apt-get update && apt-get install -y \
#     some-package \
#     && rm -rf /var/lib/apt/lists/*

# Expose n8n port
EXPOSE 5678

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:5678/healthz || exit 1