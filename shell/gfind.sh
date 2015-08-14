#!/bin/bash 
#Seach files or subfiles which contais the specific keyword
#Usage gfind.sh keyword_to_search
grep --ignore-case -E $1 . -R --color=always -n
