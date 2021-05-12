# Maid

Maid is an agent that (ideally) runs inside VMs. It exposes a gRPC service to control the keyboard and mouse, and a REST service to fetch audio and video streams.

## Building

Maid is made to run in Docker, so it is recommended to use the included Dockerfile.
```
docker build -t maid -q . && docker run --rm maid
```
