FROM alpine:3.7

ADD https://storage.googleapis.com/kubernetes-release/release/v1.6.4/bin/linux/amd64/kubectl /usr/local/bin/kubectl

RUN chmod +x /usr/local/bin/kubectl

RUN apk update && apk upgrade && \
  apk add --no-cache git docker

RUN mkdir /root/.kube

WORKDIR /root

COPY entrypoint.sh /

CMD [ "/bin/sh" , "/entrypoint.sh" ]
