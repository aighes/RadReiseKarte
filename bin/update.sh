#!/bin/bash
rm -rf ./lib
rm mkgmap.jar
rm splitter.jar

wget --timestamping http://www.mkgmap.org.uk/download/mkgmap-latest.tar.gz
wget --timestamping http://www.mkgmap.org.uk/download/splitter-latest.tar.gz
tar -xzf mkgmap-latest.tar.gz
tar -xzf splitter-latest.tar.gz

mv ./mkgmap-r*/mkgmap.jar ./mkgmap.jar
mv ./mkgmap-r*/lib/ ./lib/
mv ./splitter-r*/splitter.jar ./splitter.jar
mv ./splitter-r*/lib/* ./lib/

rm -rf ./mkgmap-r*
rm -rf ./splitter-r*
