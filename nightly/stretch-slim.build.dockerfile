#FROM dockerimages/deno:master as deno_from_scratch
FROM debian:stretch-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates
#WORKDIR /opt/
COPY --from=dockerimages/deno:master /opt/deno/out/debug/deno /usr/local/bin/
CMD ["deno", "--no-prompt"] 
