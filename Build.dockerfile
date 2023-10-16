#FROM crops/poky:ubuntu-22.04 AS tools-environment
#
#USER root
#
#RUN apt-get update -y && apt-get upgrade -y && apt-get install -y ca-certificates
#
#COPY LiebherrRootCA2.cer /usr/local/share/ca-certificates/LiebherrRootCA2.crt
#COPY LiebherrRootCA.cer /usr/local/share/ca-certificates/LiebherrRootCA.crt
#COPY LiebherrPMECA01.cer /usr/local/share/ca-certificates/LiebherrPMECA01.crt
#COPY LiebherrPMECA02.cer /usr/local/share/ca-certificates/LiebherrPMECA02.crt
#
#RUN update-ca-certificates
#
#WORKDIR /workdir
#
#RUN git clone https://github.com/niko-dunixi/git-openssl-shellscript.git git-openssl && \
#    apt-get remove -y git && \
#    pushd git-openssl && \
#    ./compile-git-with-openssl.sh && \
#    popd

FROM alpine:latest AS source-environment

RUN apk update && apk add git ca-certificates

#COPY LiebherrRootCA2.cer /usr/local/share/ca-certificates/LiebherrRootCA2.crt
#COPY LiebherrRootCA.cer /usr/local/share/ca-certificates/LiebherrRootCA.crt
#COPY LiebherrPMECA01.cer /usr/local/share/ca-certificates/LiebherrPMECA01.crt
#COPY LiebherrPMECA02.cer /usr/local/share/ca-certificates/LiebherrPMECA02.crt
#
#RUN update-ca-certificates

ENV POKY_BRANCH honister

WORKDIR /usr/local/src

RUN git clone -b $POKY_BRANCH https://git.yoctoproject.org/poky $POKY_BRANCH && \
    cd $POKY_BRANCH && \
    git clone -b $POKY_BRANCH https://git.yoctoproject.org/meta-raspberrypi && \
    git clone -b $POKY_BRANCH https://git.openembedded.org/meta-openembedded

FROM crops/poky:ubuntu-22.04 AS image-builder


ENV POKY_BRANCH honister

COPY --from=source-environment /usr/local/src /workdir/

VOLUME /home/usersetup/build
VOLUME /home/usersetup/sources

#RUN source $POKY_BRANCH/oe-init-build-env /build

ENTRYPOINT ["/bin/bash"]
