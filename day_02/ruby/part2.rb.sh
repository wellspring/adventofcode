#!/bin/bash
emptyinput() { test -t 0; }
no() { ! type "$1" &>/dev/null; }
if no ruby; then echo "Please install ruby to use this script." && exit; fi
if emptyinput; then echo "Usage: $0 < input" && exit; fi

# Solution of day #2, part 2 - Ruby (oneliner; 89 char)
ruby -ne 'r||=0;b=$_.split("x").map(&:to_i);r+=b.inject(1,&:*)+b.sort[0,2].inject(0,&:+)*2;END{p r}'
