FROM ubuntu:20.04 AS stage1
ARG MICROPYTHON_RELEASE
WORKDIR /app
COPY ./build.sh /app/build.sh
RUN /app/build.sh

FROM scratch AS export-stage
ARG MICROPYTHON_RELEASE
COPY --from=stage1 "/app/micropython-${MICROPYTHON_RELEASE}/ports/unix/micropython" .
