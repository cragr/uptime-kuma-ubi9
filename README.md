Uptime Kuma UBI9 Container
==========================

This repository provides a rootless **UBI9 (Universal Base Image 9)**-based containerized version of **Uptime Kuma**, a self-hosted monitoring tool similar to UptimeRobot.

Overview
--------

This container is built using **Red Hat UBI 9** as the base image, providing a lightweight and enterprise-ready platform for running Uptime Kuma. Uptime Kuma is an easy-to-use, beautiful dashboard for monitoring uptime with built-in notifications and alerts.

Features
--------

-   Built on **Red Hat UBI 9** for compatibility with RHEL and OpenShift container support policy.
-   Runs **Uptime Kuma**, providing self-hosted monitoring for websites and services.
-   Easy configuration and deployment in containerized environments.
-   Supports Docker, OpenShift, and Kubernetes-based deployments.
-   Rootless Container

Containerfile
-------------

The `Containerfile` (Dockerfile-equivalent) provided in this repository is used to build the Uptime Kuma container. It installs the necessary dependencies, sets up the Uptime Kuma application, and configures the container for runtime execution.

### Key Steps in the Containerfile:

1.  **Base Image**: UBI 9 minimal is used as the base image for the container.
2.  **Install Dependencies**: Installs required dependencies such as Node.js, sqlite, npm, and git.
4.  **Set Up Uptime Kuma**: Uptime Kuma is cloned from the official repository and installed using `npm`.
5.  **Expose Port**: The application is exposed on port `3001`.
6.  **Entrypoint**: The container runs Uptime Kuma using node on startup.

Usage
-----

### Building the Image

To build the Uptime Kuma container image using the `Containerfile`:

```
git clone https://github.com/cragr/uptime-kuma-ubi9.git
cd uptime-kuma-ubi9
podman build -t uptime-kuma-ubi9 .
```

Alternatively, you can use Docker:

```
git clone https://github.com/cragr/uptime-kuma-ubi9.git
cd uptime-kuma-ubi9
docker build -t uptime-kuma-ubi9 .
```

### Running the Container

Once the image is built, you can run the container using the following commands:

#### Podman:

```
podman run -d \
  --name uptime-kuma \
  -p 3001:3001 \
  uptime-kuma-ubi9
```

#### Docker:

```
docker run -d \
  --name uptime-kuma \
  -p 3001:3001 \
  uptime-kuma-ubi9
```

### Access Uptime Kuma

After starting the container, Uptime Kuma will be accessible on port `3001`:

```
http://localhost:3001
```

You can log in and set up monitoring for your services and websites using Uptime Kuma's intuitive web interface.


Contributing
------------

If you encounter any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

License
-------

This repository is licensed under the MIT License.
