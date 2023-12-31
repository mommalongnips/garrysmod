FROM ubuntu

ENV LANG en_US.utf8

RUN dpkg --add-architecture i386 && \
        apt-get update -y && \
        apt-get install -y wget unzip nano sudo locales locales-all lib32z1 lib32gcc-s1 lib32stdc++6 && \
        rm -rf /var/lib/apt/lists/* && \
        localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
        useradd -m steam

WORKDIR /

COPY ./bootstart.sh ./
RUN sudo chmod +x ./bootstart.sh && \
    sudo chown steam:steam ./bootstart.sh /home/steam

ENV MAP="gm_flatgrass"
ENV MAX_PLAYERS="12"
ENV GAMEMODE="sandbox"
ENV WORKSHOP_COLLECTION=""
ENV AUTH_KEY=""

# Run startup script. Using CMD so it can be skipped on container create
CMD ["./bootstart.sh"]
