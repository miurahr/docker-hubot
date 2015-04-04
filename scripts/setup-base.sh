#! /bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get -y install \
  build-essential \
  supervisor \
  curl \
  unzip \
  git-core \
  libxslt-dev \
  libxml2-dev \
  gcc \
  g++ \
  make

curl -sL https://deb.nodesource.com/setup | bash - 
apt-get install -y nodejs

