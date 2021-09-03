#!/bin/sh

docker exec -it postgres /bin/bash -c "psql -Uroot -d arg-watch"

