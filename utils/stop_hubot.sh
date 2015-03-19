#!/bin/bash

if [ -e /run/docker-hubot-lingr.pid ]; then
  DPID=`cat /run/docker-hubot-lingr.pid`
else
  #DPID=`sudo docker ps -q -l`
  exit 1
fi

sudo docker stop $DPID
