#!/bin/bash

echo "Gatling $GATLING_VERSION"
echo "Test on a default script"

/usr/local/bin/run

cleanup ()
{
  kill -s SIGTERM $!
  exit 0
}

trap cleanup SIGINT SIGTERM

while [ 1 ]
do
  sleep 60 &
  wait $!
done