# Write a method that determines and returns the ASCII string value of a string
# that is passed in as an argument. The ASCII string value is the sum of the
# ASCII values of every character in the string. (You may use String#ord to
# determine the ASCII value of a character.)
#
# ascii_value('Four score') == 984 ascii_value('Launch School') == 1251
# ascii_value('a') == 97 ascii_value('') == 0
#
=begin
P:
summary: write a method that returns ASCII value of a string (additive, every character)
input: a string
output: an integer representing ASCII value

implicit rules:
explicit rules: String#ord to get ASCII value for a character

questions: does whitespace have an ASCII value? yes. but note that calling String#ord on an empty string will result in an ArgumentError

E:
- all spaces
- test same string with all lcase versus all upcase

D:
array to hold split string

A:
- method ascii_value receives string
- test for empty string
- split string into character array
- initialize total
- iterate over string array
  - calculate ascii value of each character
  - add that value to the total
- return total from method
=end

def ascii_value(str)
  ascii_total = 0

  str.chars.each { |char| ascii_total += char.ord }

  ascii_total
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# notes
# - not necessary to explicitly return 0 for empty string because it simply will
# not iterate
# - not necessary to split string into array since it can be done with method
# call
# - note: str.chars.each == str.each_char
#
# Further exploration:
# There is an Integer method such that:
#
# char.ord.mystery == char
#
# where mystery is our mystery method. Can you determine what method name should
# be used in place of mystery? What happens if you try this with a longer string
# instead of a single character?
#
# the Integer#chr method will give the ascii value of the integer =>
# char.ord.chr == char
#
# If you try it with a longer string, it will simply encode/decode the first
# character of that string.
#
# A shorter way to calculate it: str.bytes.sum -> bytes creates an array of
# bytes (ascii values)
#
# Also:  str.sum
