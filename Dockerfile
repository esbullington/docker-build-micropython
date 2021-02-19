FROM ubuntu:20.04 AS stage-one
WORKDIR /app
COPY micropython /app/micropython
COPY ./build.sh /app/build.sh
RUN /app/build.sh

FROM scratch AS export-stage
COPY --from=stage-one /app/micropython/ports/unix/micropython .
