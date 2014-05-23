#!/bin/bash
threads=6
maxnodes=1200000

java -Xmx8G -XX:+UseCompressedOops -XX:+UseParallelGC -jar ./bin/splitter.jar --max-threads=$threads --stop-after=split --polygon-desc-file=./resources/areas.osm --write-kml=./resources/kml/areas.kml --output=o5m --status-freq=0 --max-nodes=$maxnodes ./data/planet.o5m ./data/srtm.o5m > splitter.log 2> splitter.log
sort areas.list | sed '/^$/d' | sed '/^\#/d' > ./resources/areas.list
rm areas.list
rm *.poly
rm template.args
rm densities-out.txt
mv *.args ./resources/args/
