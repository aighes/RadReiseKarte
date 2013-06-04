#!/bin/bash
java -jar ./bin/mkgmap.jar --read-config=./resources/style_rrk/options --check-styles
java -jar ./bin/mkgmap.jar ./resources/rrk_typ.txt
rm ./rrk_typ.typ
rm ./osmmap.tdb
