#!/bin/bash
clear
for a in {0..10}; do
    echo ":-----------------------:" 
    for b in {0..10}; do
        echo $'|\t'"$a x $a = "$[$a*$b]$'\t|'
        $b -eq "10"?echo ":-----------------------:":
    done
done

exit $?
