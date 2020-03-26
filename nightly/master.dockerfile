## master build deno from scratch
FROM dockerimages/deno:v0.37-buildcache

RUN git pull origin master && git submodule update
RUN ccache -s
RUN ./tools/build.py
RUN mv /opt/deno/out/release/deno /usr/local/bin/deno