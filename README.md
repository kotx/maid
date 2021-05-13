# Maid

Maid is an agent that (ideally) runs inside VMs. It exposes a gRPC service to control the keyboard and mouse.

## Getting started

Maid is made to run in Docker, so it is recommended to use the included Dockerfile.

```
docker build -t maid -q . && docker run --rm -p 127.0.0.1:9001:80 maid
```

For local development it may be more useful to run Docker with these flags:

```
docker build -t maid . && docker run --init --rm -it -p 127.0.0.1:9001:80 maid
```

## Next steps

However, the default Dockerfile only provides a minimal environment without any graphical interfaces.
You may build on the base Dockerfile to install Chromium, gstreamer, etc. if you want actual functionality.
