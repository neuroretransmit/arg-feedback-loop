#!/bin/sh

alias dockercontainerrmall='docker rm $(docker ps -a -q)'
alias dockerimagermall='docker rmi $(docker images -q)'
alias dockerkillall='docker kill $(docker ps -q)'
alias dockernuke='dockerkillall; dockercontainerrmall; dockerimagermall'
dockernuke
# Remove all volumes
docker-compose down -v
docker exec -it postgres /bin/bash -c "printf 'DROP DATABASE arg-watch; CREATE DATABASE arg-watch; ' |  psql postgres -U root"

