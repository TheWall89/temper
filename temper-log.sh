#!/bin/bash

FILE="$1"
DATE=$(date --iso-8601='minute')
INDOOR=$(./temper.py -i -o -8)
OUTDOOR="NA" # TODO
if [ "$(wc -l "${FILE}" | cut -d' ' -f1)" -gt 100 ]; then
   sed -i -e '2d' "${FILE}"
fi
echo "$DATE,$INDOOR,$OUTDOOR" >> "${FILE}"
