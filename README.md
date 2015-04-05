docker-hubot-lingr
===================

Run hubot with lingr adapter on Docker. 

## Usage


```
$ git clone https://github.com/miurahr/docker-hubot-lingr.git
$ cd docker-hubot-lingr
$ cp docker-compose.yml.sample docker-compose.yml
$ vi docker-compose.yml
$ docker-compose up -d
```

## Rebuild

```
$ cd docker-hubot-lingr
$ vi config
$ docker-compose build
```

## Debug

Log in to running image like;

```
$ docker ps -a
$ docker exec -t -i dockerhubotlingr_HubotLingr_1 /bin/bash
# cd /var/log/hubot
```
