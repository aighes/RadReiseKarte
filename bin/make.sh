#!/bin/bash
wget -O - http://m.m.i24.cc/osmconvert.c | cc -x c - -lz -O3 -o /usr/bin/osmconvert
wget -O - http://m.m.i24.cc/osmfilter.c |cc -x c - -O3 -o /usr/bin/osmfilter
wget -O - http://m.m.i24.cc/osmupdate.c | cc -x c - -o /usr/bin/osmupdate

rm osmconvert.c
rm osmupdate.c
rm osmfilter.c
