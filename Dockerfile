FROM openjdk:17.0.1-slim

MAINTAINER CraftMania.cz, <services@craftmania.cz>

RUN apt-get update -y \
 	&& apt-get install -y curl ca-certificates openssl git tar sqlite3 fontconfig libfreetype6 tzdata iproute2 libstdc++6 sudo \
 	&& useradd -d /home/container -m container

## RUN echo "container:container" | chpasswd && adduser container sudo

RUN echo container     ALL=(ALL) NOPASSWD:ALL >> /etc/sudoers

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
