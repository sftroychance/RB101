# The result of the following statement will be an error:
#
# puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?
#
# This will give an error (no implicit conversion of Integer into String) because the integer needs to be converted to a string in order to print with puts. String interpolation does this automatically. Two fixes:

puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"
