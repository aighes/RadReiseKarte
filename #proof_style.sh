#!/bin/bash
java -jar -Xmx6000M ./bin/mkgmap.jar --style-file=./resources/style_rrk --check-styles
java -jar -Xmx6000M ./bin/mkgmap.jar --help=options > help.txt
java -jar -Xmx6000M ./bin/mkgmap.jar ./resources/rrk_typ.txt
rm ./rrk_typ.typ
rm ./osmmap.img
rm ./osmmap.tdb
read -p "Press any Key to exit script"
exit
