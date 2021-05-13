FROM alpine:latest AS base
WORKDIR /maid
EXPOSE 80

FROM alpine:latest AS build

# Build deps
RUN apk --no-cache add cmake build-base \
    grpc grpc-dev protobuf-dev c-ares-dev

WORKDIR /usr/src/maid
COPY . .

# Workaround for "protoc-gen-grpc not found"
RUN ln -s $(which grpc_cpp_plugin) /usr/bin/protoc-gen-grpc

RUN cmake -B build . \
    && cmake --build build && cmake --install build

FROM base AS final
WORKDIR /opt/maid
COPY --from=build /usr/src/maid/bin .

# Runtime deps
RUN apk --no-cache add grpc

RUN chmod -R 111 /opt/maid

RUN adduser --disabled-password maid
USER maid

ENTRYPOINT ["/opt/maid/main"]
