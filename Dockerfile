# DESC: Docker file to run EB CLI tools.
FROM gliderlabs/alpine:3.6

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
      awsebcli &&\
    mkdir ~/.aws

# Expose volume for adding credentials
VOLUME ["~/.aws"]

ENTRYPOINT ["/usr/bin/eb"]
CMD ["--version"]
