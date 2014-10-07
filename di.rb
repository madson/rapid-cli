require 'rubygems'
require 'highline'

output = `git status --porcelain | grep "^[ ]\\?M" | sed s/^...//`

files = output.split("\n")

puts files


