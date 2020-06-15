#!/bin/bash

cd /root/temper

DATE=$(date --iso-8601='minute')
INDOOR=$(./temper.py -i -o -8)
OUTDOOR="NA" # TODO
if [ "$(wc -l ./temper-log.csv | cut -d' ' -f1)" -gt 100 ]; then
   sed -i -e '2d' ./temper-log.csv
fi
echo "$DATE,$INDOOR,$OUTDOOR" >> ./temper-log.csv
