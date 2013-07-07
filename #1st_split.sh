#!/bin/bash
threads=6
file=planet.o5m
maxnodes=1200000

name=MiddleAsia
java -jar ./bin/splitter.jar --max-threads=$threads --stop-after=split --status-freq=0 --max-nodes=$maxnodes --mapid=10060001 --polygon-file=./resources/poly/$name.poly ./data/$file
sort areas.list | sed '/^$/d' | sed '/^\#/d' > ./resources/list/$name.list
rm areas.list
rm areas.poly
