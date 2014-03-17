#!/bin/bash
rm -rf ./sea

wget --timestamping http://osm2.pleiades.uni-wuppertal.de/bounds/latest/bounds.zip
wget --timestamping http://osm2.pleiades.uni-wuppertal.de/sea/latest/sea.zip

unzip sea.zip -d sea
