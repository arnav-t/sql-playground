#!/bin/bash

function usage {
  echo "Usage: $(basename $0) [-cr]"
  echo -e "\t-c Create init script"
  echo -e "\t-r Run SQL server (superuser)"
  echo -e "\t-k Kill SQL server (superuser)"
}

function create_script {
  rm init.sql
  ./schema.py
  ./rows.py
}

function run_sql {
  docker run --rm --name postgres -e POSTGRES_PASSWORD=lol -d postgres:alpine
  sleep 5
  docker exec postgres psql -U postgres -c "$(cat init.sql | tr -d "\n")"
  docker exec -it postgres psql -U postgres
}

function kill_sql {
  docker kill postgres
}

if [[ ${#} -eq 0 ]]; then
  usage
fi

while getopts ":crk" arg; do
  case "${arg}" in
    c) create_script ;;
    r) run_sql ;;
    k) kill_sql ;;
    ?) echo "Invalid option: -${OPTARG}" ;;
  esac
done