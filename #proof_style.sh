#!/bin/bash
java -jar ./bin/mkgmap-overview2.jar --read-config=./resources/style_rrk_ov/options --check-styles
java -jar ./bin/mkgmap-overview2.jar ./resources/rrk_typ.txt
rm ./rrk_typ.typ
rm ./osmmap.tdb
