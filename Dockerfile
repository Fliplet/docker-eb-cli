# This image is the CircleCI image to deploy new releases and needs to be pushed to the Docker Hub.
# https://hub.docker.com/r/fliplet/eb-cli/tags/
#
# Here's the instructions about how to build it:
#
# $ docker build -t fliplet/eb-cli .
# $ docker images
# $ docker tag <tag> fliplet/eb-cli:<version>
# $ docker login --username=fliplet --email=<email>
# $ docker push fliplet/eb-cli:<version>
FROM gliderlabs/alpine:3.6
LABEL maintainer="Fliplet <dev@fliplet.com>"

ENV PAGER="more"

RUN apk --no-cache add \
      bash \
      curl \
      git \
      jq \
      groff \
      py-pip \
      python &&\
    pip install --upgrade \
      pip \
      awscli \
      awsebcli && \
    mkdir ~/.aws

# Expose volume for adding credentials
VOLUME ["~/.aws"]

ENTRYPOINT ["/usr/bin/eb"]
CMD ["--version"]
