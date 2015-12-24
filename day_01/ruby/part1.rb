#!/usr/bin/env ruby
input = STDIN.readline.chomp
puts input.each_char.inject(0) {|floor,direction| floor += (direction == "(") ? 1 : -1 }
