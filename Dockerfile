FROM node:18

# Set working directory
WORKDIR /app

# Install git (optional) and n8n
RUN apt-get update && apt-get install -y git && npm install -g n8n

# Create empty data directory (n8n requires it)
RUN mkdir -p /root/.n8n

EXPOSE 80

# Environment config
ENV N8N_PORT=80
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http
ENV N8N_EDITOR_BASE_URL=https://n8n-dhrr.onrender.com
ENV WEBHOOK_TUNNEL_URL=https://n8n-dhrr.onrender.com
ENV N8N_DIAGNOSTICS_ENABLED=false
ENV N8N_VERSION_NOTIFICATIONS_ENABLED=false
N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Run n8n
CMD ["n8n"]
