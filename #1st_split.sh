#!/bin/bash
threads=6
maxnodes=1200000

name=Mallorca
mapid=1020
java -jar ./bin/splitter.jar --max-threads=$threads --stop-after=split --write-kml=./resources/kml/$name".kml" --status-freq=0 --max-nodes=$maxnodes --mapid=$mapid"0001" --polygon-file=./resources/poly/$name.poly ./data/planet.o5m ./data/srtm.o5m
sort areas.list | sed '/^$/d' | sed '/^\#/d' > ./resources/list/$name.list
rm areas.list
rm areas.poly
