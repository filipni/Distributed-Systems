#! /bin/bash

repy=demokit/repy.py
restricts=demokit/restrictions.default
file=main.repy

for i in {63100..63104}
do
    python $repy $restricts $file $i 127.0.0.1 &
done
