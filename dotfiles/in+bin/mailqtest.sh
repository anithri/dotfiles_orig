#!/bin/bash
 
MAILQ=`curl -s http://gust.cppwind.local/monitor/mailq`
if [ $MAILQ == 'OK' ] ; then
echo '${color green}'$MAILQ'  '
else
echo '${color red}'$MAILQ'  '
fi

