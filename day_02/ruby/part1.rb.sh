#!/bin/bash
emptyinput() { test -t 0; }
no() { ! type "$1" &>/dev/null; }
if no ruby; then echo "Please install ruby to use this script." && exit; fi
if emptyinput; then echo "Usage: $0 < input" && exit; fi

# Solution of day #2, part 1 - Ruby (oneliner; 89 char)
ruby -ne 'l,w,h=$_.split("x").map(&:to_i);s=[l*w,w*h,h*l];r||=0;r+=s.inject(0,&:+)*2+s.min;END{p r}'
