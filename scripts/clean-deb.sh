#! /bin/bash
set -e

# clean apt caches
apt-get clean
find /var/lib/apt/lists/ -type f -exec rm -f {} \;
