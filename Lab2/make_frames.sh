#!/bin/bash
echo "<html><body>"
for y in `cat neighborlist.txt` 
do 
echo "<iframe src=\"http://$y\" width="48%" height="48%"></iframe>"
done
echo "</body></html>"
