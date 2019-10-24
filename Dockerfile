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
FROM fliplet/api:1.23
LABEL maintainer="Fliplet <dev@fliplet.com>"

ENV PAGER="more"

RUN pip install awsebcli --upgrade

# Expose volume for adding credentials
VOLUME ["~/.aws"]

ENTRYPOINT ["eb"]
CMD ["--version"]
