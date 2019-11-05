# bash example playground

This is a hacked up version of the [Golang playground](https://github.com/golang/playground) sources
for use as an example application within a talk on container security.

This should **not be deployed** in any public way as-is as it will allow execution of bash scripts
either directly on the host (if run as a standalone application) or within a container, if run
containerized via Docker or Kubernetes or similar runtime/orchestration environments.

When used as an example during a talk, several layers of defense are added to show effective methods of limiting the blast radius of exposing a direct shell interface to the web, which is in general a really, really bad idea of course.

## Building

```bash
# build the image
docker build -t playground .
```

## Running

```bash
docker run --name=play --rm -p 8080:8080 playground
```