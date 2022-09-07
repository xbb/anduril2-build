FROM ubuntu:22.04

ARG DFP_VERSION=1.10.348

RUN apt update && \
    apt -y install gcc-avr avr-libc curl unzip make && \
    mkdir -p /opt/attiny && \
    cd /opt/attiny && \
    curl -o /tmp/dfp.zip "http://packs.download.atmel.com/Atmel.ATtiny_DFP.$DFP_VERSION.atpack" && \
    unzip /tmp/dfp.zip -d /opt/attiny/ && \
    rm /tmp/dfp.zip && \
    rm -rf /var/lib/apt/lists/*

ENV ATTINY_DFP=/opt/attiny

VOLUME /src

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]