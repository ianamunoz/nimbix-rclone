FROM ubuntu:16.04

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install curl && \
    curl -H 'Cache-Control: no-cache' \
        https://raw.githubusercontent.com/nimbix/image-common/master/install-nimbix.sh \
        | bash

RUN apt-get install -y parallel

ADD NAE/AppDef.json /etc/NAE/AppDef.json

RUN wget https://redirector.gvt1.com/edgedl/go/go1.9.2.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.9.2.linux-amd64.tar.gz

ENV GOPATH=/go
ENV PATH=$PATH:/usr/local/go/bin:/go/bin

RUN go get -u -v github.com/ncw/rclone

RUN echo "PATH=$PATH:/usr/local/go/bin:/go/bin" >> /home/nimbix/.bashrc

# Expose port 22 for local JARVICE emulation in docker
EXPOSE 22
