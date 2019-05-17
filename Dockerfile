#
# Lakka Dockerfile for use with Gitlab CI/CD
#

FROM ubuntu:bionic

ARG uid
ARG branch=master
ENV branch=$branch

RUN apt-get update && \
    apt-get install -y unzip && \
    useradd -d /developer -m developer && \
    chown -R developer:developer /developer

RUN apt-get upgrade -y \
	&& apt-get install -y \
		build-essential \
		bash \
		bc \
		bzip2 \
		diffutils \
		g++ \
		gawk \
		gcc \
		git-core \
		gperf \
		gzip \
		libjson-perl \
		libncurses5-dev \
		lzop \
		make \
		patch \
		patchutils \
		perl \
		sed \
		tar \
		texinfo \
		unzip \
		wget \
		xfonts-utils \
		xsltproc \
		xz-utils \
		zip \
		libssl-dev \
		u-boot-tools \
		sudo \
		libglib2.0-dev \
		doxygen \
		bsdmainutils \
		swig \
		curl \
		gcc-arm-linux-gnueabi \
		gcc-aarch64-linux-gnu \
		libasound2 \
		xxd \
		meson \
		ninja-build \
	&& rm -rf /var/lib/apt/lists/*

RUN echo "developer:developer" | chpasswd && adduser developer sudo

ENV HOME=/developer
ENV DISTRO=Lakka
ENV PROJECT=Switch
ENV DEVICE=L4T
ENV ARCH=aarch64

USER root
WORKDIR /developer
VOLUME /developer

CMD /bin/bash

