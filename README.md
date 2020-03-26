# Deno Docker
https://hub.docker.com/r/dockerimages/deno

0.37.1-stretch 0.37.1 0 latest

Tags:
dockerimages/deno:${DENO_VERSION}
dockerimages/deno:latest 
dockerimages/deno:${DENO_VERSION}-stretch
dockerimages/deno:0.37
dockerimages/deno:0.37-strecht 
dockerimages/deno:0 
dockerimages/deno:0-stretch

 - `stretch` *[(0/stretch/Dockerfile)](https://github.com/dockerimages/docker-deno/blob/master/0/stretch/Dockerfile)*
 - `ubuntu` *[(0/ubuntu/Dockerfile)](https://github.com/dockerimages/docker-deno/blob/master/0/ubuntu/Dockerfile)*

## Contributing

Issues and pull requests are welcome. 

Docker files for [deno](https://github.com/denoland/deno) published on Dockerhub:

- Alpine Linux: (\~23Mb)
- Centos: (\~87Mb)
- Debian: (\~47Mb)
- Ubuntu: (\~48Mb)

![ci status](https://github.com/dockerimages/docker-deno/workflows/Test/badge.svg?branch=master)

_The amazonlinux1 build is used to run [deno on AWS Lambda](https://github.com/dockerimages/deno-lambda/)._

---

## Run locally:

To run `main.ts` from your working directory:

```sh
$ docker run -it --init -p 1993:1993 -v $PWD:/app dockerimages/deno:0.37.1 --allow-net /app/main.ts
```

Here, `-p 1993:1993` maps port 1993 on the container to 1993 on the host,
`-v $PWD:/app` mounts the host working directory to `/app` on the container, and
`--allow-net /app/main.ts` is passed to deno on the container.

## As a Dockerfile

```Dockerfile
FROM dockerimages/deno:0.37.1

EXPOSE 1993  # The port that your application listens to.

WORKDIR /app

# Prefer not to run as root.
USER deno

# Cache the dependencies as a layer (the following two steps are re-run only when deps.ts is modified).
# Ideally fetch deps.ts will download and compile _all_ external files used in main.ts.
COPY deps.ts .
RUN deno fetch deps.ts

# These steps will be re-run upon each file change in your working directory:
ADD . .
# Compile the main app so that it doesn't need to be compiled each startup/entry.
RUN deno fetch main.ts

CMD ["--allow-net", "main.ts"]
```

and build and run this locally:

```sh
$ docker build -t app . && docker run -it --init -p 1993:1993 app
```

---

See example directory.

Note: Dockerfiles provide a USER `deno` and DENO_DIR is set to `/deno-dir/` (which can be overridden).

_If running multiple deno instances within the same image you can mount this directory as a shared volume._
