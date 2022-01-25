#!/bin/bash
cd /home/container

echo Updating resolv.conf...
cat /etc/resolv.conf
echo Testing...
cat /sus.txt
sudo echo namespace 8.8.8.8 >> /etc/resolv.conf

# Output Current Java Version
java -version

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
