FROM ubuntu:16.04

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install curl && \
    curl -H 'Cache-Control: no-cache' \
        https://raw.githubusercontent.com/nimbix/image-common/master/install-nimbix.sh \
        | bash

RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip
RUN unzip rclone-current-linux-amd64.zip
RUN cd rclone-*-linux-amd64

RUN cp rclone /usr/bin/ && chown root:root /usr/bin/rclone && chmod 755 /usr/bin/rclone

# Expose port 22 for local JARVICE emulation in docker
EXPOSE 22
