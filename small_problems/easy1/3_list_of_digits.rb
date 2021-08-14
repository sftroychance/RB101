# Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

# Examples:

#   puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
#   puts digit_list(7) == [7]                     # => true
#   puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
#   puts digit_list(444) == [4, 4, 4]             # => true

def digit_list(number)
  num_array = number.to_s.split('')
  num_array.collect { |str| str.to_i } 
  # more succinct, per solution: number.to_s.split('').map(&:to_i)
  # see my notes for further explanation of the (&:methodname) syntax
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
