# Write a method that takes an Array of integers as input, multiplies all the
# numbers together, divides the result by the number of entries in the Array,
# and then prints the result rounded to 3 decimal places. Assume the array is
# non-empty.
#
# Examples:
#
# show_multiplicative_average([3, 5])                # => The result is 7.500
# show_multiplicative_average([6])                   # => The result is 6.000
# show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
=begin
P:
summary: method that takes an array of integers and returns a float value
rounded to three places that is the multiplicative average of that array of
integers
input: an array of integers
output: print to screen "The result is" with result formatted to 3 decimal places

implicit rules:
explicit rules: the array is non-empty

questions:

E:

D:

A:
1. write a method that takes an array parameter
2. multiply all the numbers in the array, divide by array size as a float
3. return rounded result formatted to 3 decimal places

=end

def show_multiplicative_average(num_arr)
  result = num_arr.reduce(&:*).send(:/, num_arr.size.to_f).round(3)
  puts "The result is #{format('%0.3f', result)}"
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
