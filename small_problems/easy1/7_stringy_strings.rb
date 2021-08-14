# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

# Examples:

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# The tests above should print true.

def stringy(length)
  output = "10" * (length / 2)
  length.odd? ? output << "1" : output 
end 

# further exploration (and different approach)
def stringy2(length, start=1)
  str_array = []
  case start
  when 1
    length.times { |idx| idx.even? ? str_array << 1 : str_array << 0 }
  when 0
    length.times { |idx| idx.odd? ? str_array << 1 : str_array << 0 }
  end

  str_array.join
end 

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts stringy2(6, 1) == '101010'
puts stringy2(9, 0) == '010101010'
puts stringy2(4, 0) == '0101'
puts stringy2(7, 1) == '1010101'
