#!/bin/bash

MASK='ifconfig "$1" | sed -rn '2s/ .*:(.*)$/\1/p';


for BINNUM in $( echo $1 | sed -e 's/\./ /g' ); do  
  BINNUM="`echo "ibase=10; obase=2; $BINNUM" | bc`";  
  
  while [ "`echo "${#BINNUM}"`" -lt 8 ]; do  
    BINNUM=0$BINNUM  
  done  
   BINRES=$BINRES.$BINNUM  
done  

echo $MASK
echo $BINRES
