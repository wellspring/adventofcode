#!/bin/bash
set -e

# BEGIN
#echo "Advent of Code -- TESTER"
#echo "========================"
#echo ""

# Check arguments
if [   -z "$1" ]; then echo "Usage: $0 <script_path>"; exit -1; fi
if [ ! -f "$1" ]; then echo "Error: $1 should be an existing file"; exit -1; fi
if [ ! -x "$1" ]; then echo "Error: $1 should be an executable app/script"; exit -1; fi

# Setup application path
test_app=$(readlink -f "$1")
echo " [+] Testing $test_app ..."

# Initialize test counters
test_counter=0
test_fails=0

# TEST function helper to run the test app and compare the output to what's expected.
#  (Usage: test <input> <expected_output>)
test() {
  test_counter=$(($test_counter+1))
  input=_

  if [ -n "$2" ]; then
    input=$1
    expected_output=$2

    echo -n "   [+] Running test #$test_counter ... "
    output=$(echo "$input" | $test_app)

    if [ $output = $expected_output ]; then
      echo -e "\e[32m[OK]\e[0m"
    else
      echo -e "\e[31m[FAIL]\e[0m"
      echo "    INPUT  = $input"
      echo "    OUTPUT = $output"
      echo "      (should be: $expected_output)"
      test_fails=$(($test_fails+1))
    fi
  else
    echo -e "   [+] Running final test with real input ... \e[33m[ANSWER = $($test_app < input)]\e[0m"
  fi
}

# END
at_exit() {
  #echo ""
  #echo "Done."
  #echo ""
  if [ $test_fails -eq 0 ]; then
    test REAL_INPUT
  fi
}
trap at_exit EXIT
