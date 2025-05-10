#!/bin/bash

set -e

echo "📥 Downloading MTA server files..."
cd /tmp
curl -sSL -o multitheftauto_linux_x64.tar.gz https://linux.multitheftauto.com/dl/multitheftauto_linux_x64.tar.gz
curl -sSL -o mta-baseconfig.tar.gz https://linux.multitheftauto.com/dl/baseconfig.tar.gz
curl -sSL -o mtasa-resources-latest.zip https://mirror.multitheftauto.com/mtasa/resources/mtasa-resources-latest.zip

mkdir -p /mnt/server
tar -xvf multitheftauto_linux_x64.tar.gz
cp -rf multitheftauto_linux_x64/* /mnt/server

if [ ! -f /mnt/server/x64/libmysqlclient.so.16 ]; then
    curl -L http://nightly.mtasa.com/files/libmysqlclient.so.16 -o /mnt/server/x64/libmysqlclient.so.16
fi

mkdir -p /mnt/server/mods/deathmatch/resources
unzip -o -d /mnt/server/mods/deathmatch/resources mtasa-resources-latest.zip

tar -xvf mta-baseconfig.tar.gz
cp -rf baseconfig/* /mnt/server/mods/deathmatch

chown -R root:root /mnt
export HOME=/mnt/server

echo "✅ Installation completed."
