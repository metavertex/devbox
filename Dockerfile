FROM ubuntu:18.04

LABEL maintainer="Tobias Johnson <toby@metavertex.com>"

RUN apt-get update && apt-get install -qq -y --fix-missing --no-install-recommends build-essential mariadb-client-core-10.1 curl jq iputils-ping dnsutils command-not-found apt-transport-https gnupg sudo lsb-release vim file ca-certificates git

RUN ["/bin/bash", "-c", "echo -e \"deb http://packages.cloud.google.com/apt cloud-sdk-$(lsb_release -cs) main\ndeb https://apt.kubernetes.io/ kubernetes-xenial main\" > /etc/apt/sources.list.d/google-tools.list"]
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN apt-get update && apt-get install -qq -y kubectl google-cloud-sdk

RUN curl -sL https://github.com/digitalocean/doctl/releases/download/v1.12.0/doctl-1.12.0-linux-amd64.tar.gz | tar xzf - -C /usr/local/bin/ doctl
