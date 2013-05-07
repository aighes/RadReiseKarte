#!/bin/bash

GenerateMap()
{
echo $TIME generating $name >> log.log
echo $TIME generating $name

rm ./maps/$name/*.tmp

echo $famid>>mkgmap_error.log

java -Xmx10000M -XX:+UseCompressedOops -jar ./bin/mkgmap-overview2-r2591.jar --read-config=./resources/style_rrk_ov/options --max-jobs=$threads --code-page=$codepage --mapname=$famid"0001" --overview-mapname=$famid"0000" --family-name="RRK $name" --series-name="RRK $name $heute" --description="RadReiseKarte $heute" --family-id=$famid --output-dir=./maps/$name $famid*.o5m ./resources/rrk_typ.txt 2>> mkgmap_error.log

echo $TIME compressing $name >> log.log
echo $TIME compressing $name

echo "Map data (c) OpenStreetMap and contributors" > ./maps/$name/$famid"0000_license.txt"
echo "http://www.openstreetmap.org/" >> ./maps/$name/$famid"0000_license.txt"
echo "" >> ./maps/$name/$famid"0000_license.txt"
echo "Map data licenced under Open Database License (ODbL) 1.0" >> ./maps/$name/$famid"0000_license.txt"
echo "See http://opendatacommons.org/licenses/odbl/" >> ./maps/$name/$famid"0000_license.txt"
echo "" >> ./maps/$name/$famid"0000_license.txt"
echo "Map created with mkgmap-r$version" >> ./maps/$name/$famid"0000_license.txt"

rm $output/upload/$name.7z
rm $output/upload/MS_$name.7z

7za a -t7z $output/upload/$name.7z ./maps/$name/gmapsupp.img ./resources/license.txt ./resources/legende_de.png -mx9

rm maps/$name/gmapsupp.img

cp -rf ./maps/$name/ $windows"/"

makensis ./maps/$name/$famid"0000.nsi"

7za a -t7z $output/upload/MS_$name.7z ./maps/$name/*.img ./maps/$name/*.mdx ./resources/license.txt ./maps/$name/*.typ ./maps/$name/*.tdb ./maps/$name/Install.exe ./resources/legende_de.png -mx9

rm ./maps/$name/*.img
rm ./maps/$name/*.mdx
rm ./maps/$name/*.typ
rm ./maps/$name/*.tdb
rm ./maps/$name/Install.exe

echo $TIME $name finished >> log.log
echo $TIME $name finished
return
}

heute=`date +"%Y%m%d"`
basefile=/home/OSM/mkgmap
output=/media/D/RadReiseKarte
windows=/media/D/Garmin
threads=4

echo "" >> log.log
echo $heute >> log.log
echo "" >> log.log


java -ea -jar ./bin/mkgmap.jar --version 2>temp
version=`cat temp`
rm temp

read -p "Update OSM-data? y/n : " update
if [ "$update" == "y" ]; then
	echo $TIME updating planet >> log.log
	echo $TIME updating planet
	mv ./data/planet_srtm.o5m ./data/planet_srtm_old.o5m
	osmupdate --verbose ./data/planet_srtm_old.o5m ./data/planet_srtm.o5m
	echo $TIME copying planet >> log.log
	echo $TIME copying planet
	split=y
fi
if [ "$split" != "y" ]; then
	read -p "Split OSM-data? y/n : " split
fi

if [ "$split" == "y" ]; then
	rm *.o5m
	echo $TIME splitting planet >> log.log
	echo $TIME splitting planet
	java -Xmx10000M -XX:+UseCompressedOops -XX:+UseParallelGC -jar ./bin/splitter.jar --status-freq=0 --output=o5m --max-areas=2048 --max-threads=$threads --overlap=0 --keep-complete --split-file=resources/areas.list --description=RadReiseKarte ./data/planet_srtm.o5m > splitter.log
	rm template.args
fi

echo "Map data (c) OpenStreetMap contributors, ODbL (http://opendatacommons.org/licenses/odbl/)" > ./resources/license-mkgmap.txt
echo "Map created with mkgmap-r$version and data of $heute" >> resources/license-mkgmap.txt

echo >mkgmap_error.log

name=Germany-Alps
famid=1000
codepage=1252
GenerateMap

name=Turkey
famid=1100
codepage=1254
GenerateMap

name=Scandinavia
famid=1200
codepage=1252
GenerateMap

name=Poland-Czech
famid=1300
codepage=1250
GenerateMap

name=BeNeLux
famid=1400
codepage=1252
GenerateMap

name=Australia
famid=1700
codepage=1252
GenerateMap

name=NewZealand
famid=1800
codepage=1252
GenerateMap

name=GreatBritain
famid=1900
codepage=1252
GenerateMap

echo $TIME finished >> log.log
echo $TIME finished
echo "" >>log.log
