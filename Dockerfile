FROM golang:1.10

ENV LIBRDKAFKA_REF=v0.11.4

COPY build.sh /build.sh
RUN . /build.sh && rm /build.sh
