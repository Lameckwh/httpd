# Use UBI Python 3.12 minimal as base image for smaller size
FROM registry.redhat.io/ubi9/python-312-minimal:latest

# Set metadata labels for OpenShift
LABEL io.openshift.tags="python,http-server" \
    #   io.openshift.expose-services="8000:http" \
      io.k8s.description="A simple HTTP server built with Python" \
      maintainer="Your Name"

# Set working directory
WORKDIR /app

# Copy application files
COPY server.py /app/server.py
COPY index.html /app/index.html

# Adjust permissions for OpenShift (root group ownership and permissions)
RUN chgrp -R 0 /app && \
    chmod -R g=u /app && \
    chmod +x /app/server.py

# Expose port 8000 (non-privileged)
# EXPOSE 8000

# Set environment variables
# ENV PYTHONUNBUFFERED=1 \
#     PORT=8000

# Use exec form for proper signal handling
CMD ["python", "/app/server.py"]