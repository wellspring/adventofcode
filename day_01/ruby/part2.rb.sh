#!/bin/bash
emptyinput() { test -t 0; }
no() { ! type "$1" &>/dev/null; }
if no ruby; then echo "Please install ruby to use this script." && exit; fi
if emptyinput; then echo "Usage: $0 < input" && exit; fi

# Solution of day #1, part 2 - Ruby (oneliner; 65 char)
ruby -pe 'f=0;i=1;$_.each_char{|c|($_=i;break)if((f+=c=="("?1:-1)<0);i=i+1}'
