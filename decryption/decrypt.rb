#!/home/gitpod/.rvm/rubies/ruby-2.6.6/bin/ruby
require 'highline'
require_relative './helpers'
require_relative './ceasar_cipher'

INPUT_FILE = "input.txt"
TEST_INPUT_FILE = "test_input.txt"
OUTPUT_FILE = "output.txt"

# Read the input message
# Note: This currently reads the test input.
#       Your solution will be evaluated using INPUT_FILE
# text = File.read(TEST_INPUT_FILE).chomp
# Use this for the real solution
text = File.read(INPUT_FILE).chomp

#
# NOTE: This is just the example. The actual solution
#       for the real input does not use Ceasar Cipher -3
#       This is shown as a demonstration.
#       The actual solution does not use RSA encryption
#       or something similar. The order of magnitude
#       complexity is on part with the test example shown.
#       Hints will be given at 30 minutes and 60 minutes.
#       You have 90 minutes in total for the hackathon.
#
#       The following article discusses techniques for
#       solving problems like this.
#       https://tinyurl.com/y7grbrs4
#
# for a in -126..126 do
      
#  puts ceasar_cipher_decrypt(text, a)
   
# end
decrypted_text = ceasar_cipher_decrypt(text, 7)
decrypted_text = decrypted_text.reverse()

# Write the decrypted message to the output file
File.open(OUTPUT_FILE, "w") { |f| f.write decrypted_text }

#
# Display the results. This is just for information.
# Your solution will be based on the contents of OUTPUT_FILE
#
5.times do 
    puts " "
end
puts cyan "Note this is the test input. See the real #{INPUT_FILE} for this challenge."
puts cyan "The test uses ceasar cipher with -3 character offset."
puts " "
puts cyan "TEST Input Message"
puts cyan "------------------"
puts text
puts " "
puts cyan "Decrypted Content"
puts cyan "-----------------"
puts decrypted_text
puts " "

