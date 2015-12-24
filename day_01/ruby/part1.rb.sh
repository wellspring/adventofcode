#!/bin/bash
emptyinput() { test -t 0; }
no() { ! type "$1" &>/dev/null; }
if no ruby; then echo "Please install ruby to use this script." && exit; fi
if emptyinput; then echo "Usage: $0 < input" && exit; fi

# Solution of day #1, part 1 - Ruby (oneliner; 30 char)
ruby -pe '$_=$_.count("(")-$_.count(")")'
