FROM --platform=linux/amd64 ubuntu:20.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y make gcc

ADD . /repo
WORKDIR /repo/unix
ENV LD_LIBRARY_PATH=/repo/unix
RUN ldconfig
RUN ./configure
RUN make -j8
