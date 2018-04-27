#!/bin/bash

echo "The number do days since the years' beginning is $(date +%j)."

echo "The number od seconds elapsed since 01/01/1970 is $(date +%s)."

prefix=temp

suffix=$(date +%s)

filename=$prefix.$suffix

echo "Temporary filename = $filename"

exit 0
