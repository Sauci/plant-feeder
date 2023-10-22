FROM alpine:latest AS source-environment

RUN apk update && apk add git ca-certificates

ENV POKY_BRANCH honister

WORKDIR /usr/local/src

RUN git clone -b $POKY_BRANCH https://git.yoctoproject.org/poky $POKY_BRANCH && \
    cd /usr/local/src/$POKY_BRANCH && git clone -b $POKY_BRANCH https://git.yoctoproject.org/meta-raspberrypi && \
    cd /usr/local/src/$POKY_BRANCH && git clone -b $POKY_BRANCH https://git.openembedded.org/meta-openembedded && \
    cd /usr/local/src/$POKY_BRANCH && git clone -b $POKY_BRANCH https://github.com/ros/meta-ros.git

FROM crops/poky:ubuntu-20.04 AS image-builder

ENV POKY_BRANCH honister

ARG UID=70
ARG GID=70

USER root
RUN usermod -u "$UID" usersetup
RUN groupmod -g "$GID" usersetup
USER usersetup

COPY --from=source-environment /usr/local/src /workdir/
COPY --chown=usersetup sources /home/usersetup/sources/

VOLUME /home/usersetup/build
VOLUME /home/usersetup/sources

ENTRYPOINT ["/bin/bash"]
