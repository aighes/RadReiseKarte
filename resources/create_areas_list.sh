cd ./list
rm ./areas.list
dateien=`find . -type f`
for i in $dateien ; do
	while read line; do echo $line >> areas.list ;done < "$i"
done
cd ..
sort ./list/areas.list > ./areas.list
