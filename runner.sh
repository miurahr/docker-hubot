#!/bin/sh
sudo sed -ri "s/HUBOT_LINGR_BOT=/HUBOT_LINGR_BOT=${LINGR_BOT_ID}/g" /etc/supervisor/conf.d/hubot.conf
sudo sed -ri "s/HUBOT_LINGR_SECRET=/HUBOT_LINGR_SECRET=${LINGR_BOT_SECRET}/g" /etc/supervisor/conf.d/hubot.conf
supervisord -n
