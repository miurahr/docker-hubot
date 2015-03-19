#!/bin/sh
sudo docker run -d -p 22 -e "HUBOT_LINGR_BOT=bot_id" -e "HUBOT_LINGR_SECRET=xxxxxxxxx" \
  -e "HUBOT_TRELLO_KEY=key" -e "HUBOT_TRELLO_TOKEN=secret" -e "HUBOT_TRELLO_BOARD=boardid" miurahr/hubot-lingr
DPID=`sudo docker ps -q -l`
echo $DPID > /tmp/docker-hubot-lingr.pid
sudo mv /tmp/docker-hubot-lingr.pid /run/
