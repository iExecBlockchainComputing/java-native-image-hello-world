FROM registry.scontain.com:5050/sconecuratedimages/crosscompilers:alpine-scone3.0.0 AS compile-fs

USER root

RUN apk update
RUN apk add curl unzip zip tar
#RUN apk add openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN wget https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-21.0.0.2/graalvm-ce-java11-linux-amd64-21.0.0.2.tar.gz

RUN tar -xzf graalvm-ce-java11-linux-amd64-21.0.0.2.tar.gz

ENV JAVA_HOME=/graalvm-ce-java11-21.0.0.2
ENV PATH=$JAVA_HOME/bin:$PATH

RUN which java
#RUN $(which java) --version

#docker build -t crosscompiler-graalvm:21.0.0.2 .