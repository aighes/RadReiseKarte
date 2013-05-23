#!/bin/bash
threads=6
file=planet_srtm.o5m
maxnodes=1200000

name=Oman
java -jar ./bin/splitter.jar --max-threads=$threads --stop-after=split --status-freq=0 --max-nodes=$maxnodes --mapid=10100001 --polygon-file=./resources/poly/$name.poly ./data/$file
sort areas.list | sed '/^$/d' | sed '/^\#/d' > $name.list
rm areas.list
rm areas.poly
