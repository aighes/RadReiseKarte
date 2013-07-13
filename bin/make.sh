#!/bin/bash

sudo apt-get install zlib1g-dev

wget -O - http://m.m.i24.cc/osmconvert.c | cc -x c - -lz -O3 -o ./osmconvert
wget -O - http://m.m.i24.cc/osmfilter.c |cc -x c - -O3 -o ./osmfilter
wget -O - http://m.m.i24.cc/osmupdate.c | cc -x c - -o ./osmupdate

sudo mv ./osmconvert /usr/bin/osmconvert
sudo mv ./osmfilter /usr/bin/osmfilter
sudo mv ./osmupdate /usr/bin/osmupdate