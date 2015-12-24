#!/bin/bash
source ../.UNIT_TEST.sh

test  '2x3x4'     34     # 2+2+3+3 + 2*3*4 = 10 + 24 = 34
test  '1x1x10'    14     # 1+1+1+1 + 1*1*10 = 4 + 10 = 14

