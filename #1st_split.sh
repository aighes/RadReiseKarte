#!/bin/bash
threads=6
maxnodes=1200000

name=Malaysia
mapid=1014
java -Xmx8G -XX:+UseCompressedOops -XX:+UseParallelGC -jar ./bin/splitter.jar --max-threads=$threads --stop-after=split --write-kml=./resources/kml/$name".kml" --status-freq=0 --max-nodes=$maxnodes --mapid=$mapid"0001" --polygon-file=./resources/poly/$name.poly ./data/planet.o5m ./data/srtm.o5m > splitter.log 2> splitter.log
sort areas.list | sed '/^$/d' | sed '/^\#/d' > ./resources/list/$name.list
rm areas.list
rm areas.poly
rm densities-out.txt
