#!/bin/bash
ICON=/usr/share/pixmaps/32x32/fire.png
NOTIFY=notify-send
OPTIONS="--urgency=critical -t 100000 -c network -i ${ICON}"
 
curl -s $1 | grep -q "$2"  
if [ $? -eq 0 ] ; then
  echo '${color green}Up  '
else
  echo '${color red}Down  '
  $NOTIFY $OPTIONS $1 "Is not responding correctly." 
fi

