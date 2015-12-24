#!/usr/bin/env ruby

input = STDIN.readline.chomp
floor = 0

input.chars.each_with_index do |direction,charposition|
  floor += (direction == "(") ? 1 : -1
  if(floor < 0)
    puts charposition + 1
    break
  end
end
