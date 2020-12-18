#!/home/gitpod/.rvm/rubies/ruby-2.6.6/bin/ruby
require 'highline'
require_relative './helpers'

INPUT_FILE = "input.txt"
OUTPUT_FILE = "output.txt"

puts " "

text = File.read(INPUT_FILE)
ascii = text.chars.map { |c| c.ord }
shifted = ascii.map { |c| c - 3 }
answer = shifted.map { |c| c.chr }.join

puts cyan text
puts answer

