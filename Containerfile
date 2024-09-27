# Base image
FROM registry.access.redhat.com/ubi9/ubi-minimal

# Set Kuma as a Container
ENV UPTIME_KUMA_IS_CONTAINER=1

# Install necessary dependencies (curl, Node.js, git, npm)
RUN microdnf module -y enable nodejs:18 && \
    microdnf install -y git nodejs sqlite npm --nodocs --setopt=install_weak_deps=0 && \
    microdnf clean all

# Change to workdir
WORKDIR /app

# Clone Git repo, npm install and update permissions
RUN git clone --branch 1.23.X --single-branch https://github.com/louislam/uptime-kuma.git . && \
    npm run setup && \
    chown -R 1001:0 /app

# Switch to the non-root user
USER 1001

# Expose port for Uptime Kuma
EXPOSE 3001

# Run the Uptime Kuma app
CMD ["node", "server/server.js"]
