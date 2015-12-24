#!/bin/bash
set -e

mcd() { mkdir -p "$1"; cd "$1"; }

if [ -z "$AOC_SESSION" ]; then
  echo 'Error! Please login on http://www.adventofcode.com/ and set `export AOC_SESSION=...` to the value of the `session` cookie.'
  exit -1
fi

echo "Advent Of Code"
echo "--------------"
echo ""
mcd ~/dev/_challenges/adventofcode
echo " [+] Getting about page ..."
wget -qO- http://adventofcode.com/about | awk '/<article/,/<\/article>/' | sed 's/<\/\?em/**&/g;s/<\/\?code/`&/g;s/<li/  - &/g;s/<p>/\n&/g;s/ ---/&\n/;s/<[^>]*>//g;s/ \+/ /g' | fold -s -w 80 > README.md
for n in {1..25}; do
  echo " [+] Getting day $n ..."
  mcd day_$(printf '%02d' $n) >/dev/null
  wget -q --header="Cookie: session=$AOC_SESSION" http://adventofcode.com/day/${n}/input
  wget -q --header="Cookie: session=$AOC_SESSION" -O README.html http://adventofcode.com/day/$n
  awk '/<article/,/<\/article>/' README.html | sed 's/<li/  - &/g;s/<p>/\n&/g;s/ ---/&\n/;s/<[^>]*>//g;s/ \+/ /g' | fold -s -w 80 > README.txt
  awk '/<article/,/<\/article>/' README.html | sed 's/<\/\?em/**&/g;s/<\/\?code/`&/g;s/<li/  - &/g;s/<p>/\n&/g;s/ ---/&\n/;s/<[^>]*>//g;s/ \+/ /g' | fold -s -w 80 > README.md
  cd ..
done
echo ""
echo "Done."

