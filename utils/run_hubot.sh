#!/bin/sh
sudo docker run -d -p 22 -p 3000:3000 miurahr/hubot-lingr
DPID=`sudo docker ps -q -l`
echo $DPID > /tmp/docker-hubot-lingr.pid
sudo mv /tmp/docker-hubot-lingr.pid /run/
