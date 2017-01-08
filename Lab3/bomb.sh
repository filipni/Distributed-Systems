#!/bin/bash

function send_to_client {
  ip=$1
  for i in `seq 1 5`; do
    curl -d entry=t${i} ${i} -X POST http://$ip/entries
  done
}

for ip in `cat neighborlist.txt`; do
  send_to_client $ip &
done
