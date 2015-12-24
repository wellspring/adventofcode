#!/bin/bash
source ../.UNIT_TEST.sh

test  '(())'      0
test  '()()'      0
test  '((('       3
test  '(()(()('   3
test  '))((((('   3
test  '())'      -1
test  '))('      -1
test  ')))'      -3
test  ')())())'  -3

