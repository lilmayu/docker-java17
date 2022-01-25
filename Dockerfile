FROM openjdk:17.0.1-slim

MAINTAINER CraftMania.cz, <services@craftmania.cz>

RUN apt-get update -y \
 	&& apt-get install -y curl ca-certificates openssl git tar sqlite3 fontconfig libfreetype6 tzdata iproute2 libstdc++6 \
 	&& useradd -d /home/container -m container

RUN useradd -m container && echo "container:container" | chpasswd && adduser container sudo

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["sudo", "/bin/bash", "/entrypoint.sh"]
