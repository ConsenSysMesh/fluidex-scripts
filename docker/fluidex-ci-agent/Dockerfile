FROM alpine:3.7

RUN apk update && apk upgrade && \
  apk add --no-cache git docker

ADD https://storage.googleapis.com/kubernetes-release/release/v1.6.4/bin/linux/amd64/kubectl /usr/local/bin/kubectl

RUN chmod +x /usr/local/bin/kubectl