docker-hubot
============

Run hubot on Docker.

## Build docker image

```
$ git clone https://github.com/miurahr/docker-hubot-lingr.git
$ cd docker-hubot-lingr
$ vi config
$ docker-compose build
```

## Usage

Provisionings are placed in docker-compose.yml.
Please edit it before start.


```
$ cp docker-compose.yml.sample docker-compose.yml
$ vi docker-compose.yml
$ docker-compose up -d
```

## Debug

Log in to running image like;

```
$ docker ps -a
$ docker exec -t -i dockerhubot_Hubot_1 /bin/bash
# cat /var/log/hubot/hubot.log
```
