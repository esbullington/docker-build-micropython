## Dockerfile to build micropython

To build (set `MICROPYTHON_RELEASE` to desired version as released on Micropython's Github):

`DOCKER_BUILDKIT=1 docker build --rm --build-arg MICROPYTHON_RELEASE=1.14 --file Dockerfile --output out .`

Micropython for Unix will be in `out` dir.
