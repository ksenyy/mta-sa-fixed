FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    curl \
    wget \
    unzip \
    lib32gcc-s1 \
    lib32stdc++6 \
    ca-certificates \
    libssl-dev \
    libcurl4-openssl-dev \
    libncurses5 \
    libtinfo5 \
    libstdc++6 \
    xz-utils \
    tar

WORKDIR /mnt

COPY install.sh /install.sh
RUN chmod +x /install.sh && /install.sh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /mnt/server
ENTRYPOINT ["/entrypoint.sh"]
