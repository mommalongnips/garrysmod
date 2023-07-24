#!/bin/bash

wget -O /home/steam/steamcmd_linux.tar.gz "http://media.steampowered.com/client/steamcmd_linux.tar.gz" &&\
    tar -xvzf /home/steam/steamcmd_linux.tar.gz

# Update all content
/home/steam/steamcmd.sh +login anonymous +force_install_dir /home/steam/gmod +app_update 4020 validate +force_install_dir /home/steam/content/css +app_update 232330 validate +quit;

# Require clients to download workshop resources
echo "resource.AddWorkshop("$WORKSHOP_COLLECTION")" > /home/steam/gmod/garrysmod/lua/autorun/server/workshop.lua;

# Start server
/home/steam/gmod/srcds_run -game garrysmod +maxplayers $MAX_PLAYERS +map $MAP +gamemode $GAMEMODE +host_workshop_collection $WORKSHOP_COLLECTION -authkey $AUTH_KEY;