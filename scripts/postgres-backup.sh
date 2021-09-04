#!/bin/sh

mkdir -p data
docker exec -it postgres pg_dumpall -c -U root > "data/dump_$(date +%d-%m-%Y:%H:%M:%S).sql"

