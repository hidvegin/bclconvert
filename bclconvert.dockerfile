# download base image ubuntu 24.04
FROM ubuntu:24.04

# get the package
COPY bcl-convert.rpm /tmp/

# repress tzdata prompt
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
 && apt-get install -y alien \
 && rm -rf /var/lib/apt/lists/* \
 && alien -i /tmp/bcl-convert.rpm \
 && rm /tmp/bcl-convert.rpm

# make an executable the default
ENTRYPOINT ["bcl-convert"]

CMD ["--version"]
