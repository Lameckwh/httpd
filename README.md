# Simple HTTP Server

This is a basic HTTP server built with Python's built-in `http.server` module.

## How to Run

1. Make sure you have Python installed.
2. Run the server:

   ```bash
   python server.py
   ```

3. Open your browser and go to `http://localhost:8000`

The server will serve static files from the current directory.

## Docker Usage

This project includes a Dockerfile optimized for Red Hat OpenShift using UBI (Universal Base Images).

### Build the Docker Image

```bash
podman build -t httpd-server .
```

### Run the Container

```bash
podman run -p 8000:8000 httpd-server
```

### Deploy to OpenShift

1. Push the image to a registry (e.g., quay.io or your OpenShift registry)
2. Use `oc new-app` or the OpenShift web console to deploy

## Features

- Serves static files (HTML, CSS, JS, images, etc.)
- Automatically redirects root path to `index.html`
- Runs on port 8000 by default
- OpenShift-optimized with proper permissions and metadata
