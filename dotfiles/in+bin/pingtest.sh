#!/bin/bash
ICON=/usr/share/pixmaps/32x32/exclamation.png
NOTIFY=notify-send
OPTIONS="--urgency=critical -t 100000 -c network -i ${ICON}"
if ping -c 1 -W 5 $1 > /dev/null; then
  echo '${color green}Up  '
else
  echo '${color red}Down  '
  $NOTIFY $OPTIONS Uh-OH "${1} is not responding to ping" 
fi

