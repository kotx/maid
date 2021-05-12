FROM alpine:latest AS base
WORKDIR /maid
EXPOSE 80

FROM alpine:latest AS build

# Build deps
RUN apk --no-cache add cmake build-base \
    grpc grpc-dev protobuf-dev c-ares-dev

WORKDIR /usr/src/maid
COPY . /usr/src/maid

RUN cmake -B bin -DCMAKE_TOOLCHAIN_FILE= -S . \
    && cmake --build bin && cmake --install bin

FROM base AS final
WORKDIR /opt/maid
COPY --from=build /opt/maid .

# Runtime deps
RUN apk --no-cache add grpc

RUN chmod -R 111 /opt/maid

RUN adduser --disabled-password maid
USER maid

ENTRYPOINT ["/opt/maid/main"]
