#!/bin/bash

echo "Name:"
read name

for l in $name; do
    echo "$l"
done

exit $?
