#!/bin/sh

HUBOT_CONF=/etc/supervisor/conf.d/hubot.conf


# hubot_lingr environment
sudo sed -ri "s/HUBOT_LINGR_BOT=/HUBOT_LINGR_BOT=${HUBOT_LINGR_BOT}/g" $HUBOT_CONF
sudo sed -ri "s/HUBOT_LINGR_SECRET=/HUBOT_LINGR_SECRET=${HUBOT_LINGR_BOT_SECRET}/g" $HUBOT_CONF

# hubot_trello environment
sudo sed -ri "s/HUBOT_TRELLO_KEY=/HUBOT_TRELLO_KEY=${HUBOT_TRELLO_KEY}/g" $HUBOT_CONF
sudo sed -ri "s/HUBOT_TRELLO_TOKEN=/HUBOT_TRELLO_TOKEN=${HUBOT_TORELLO_TOKEN}/g" $HUBOT_CONF
sudo sed -ri "s/HUBOT_TRELLO_BOARD=/HUBOT_TRELLO_BOARD=${HUBOT_TRELLO_BOARD}/g" $HUBOT_CONF

supervisord -n
