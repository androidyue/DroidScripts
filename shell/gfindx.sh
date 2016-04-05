#!/bin/bash
grep  -E $1 --exclude-dir={.git,lib,.gradle,.idea,build,captures} --exclude={*.png,*.jpg,*.jar}  . -R --color=always -n
