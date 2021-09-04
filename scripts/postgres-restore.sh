#!/bin/sh

cat data/dump*.sql | docker exec -i postgres psql -U root -d argwatch
