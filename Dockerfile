FROM openjdk:11-slim

COPY GOSU_* /tmp/
RUN apt-get update && \
    apt-get install -y wget unzip && \
    cd /tmp && \
    wget https://repo1.maven.org/maven2/org/gosu-lang/gosu/gosu/$(cat /tmp/GOSU_VERSION)/gosu-$(cat /tmp/GOSU_VERSION)-full.zip \
        -O gosu.zip && \
    unzip gosu.zip && \
    cd gosu-$(cat /tmp/GOSU_VERSION) && \
    mv bin/* /usr/local/openjdk-11/bin && \
    mv lib/* /usr/local/openjdk-11/lib && \
    cd / && \
    apt-get remove -y wget unzip && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /tmp/gosu* /var/lib/apt/lists/*
