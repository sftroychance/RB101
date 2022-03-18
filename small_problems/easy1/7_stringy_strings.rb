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

# lines `12-15` define method `stringy`, which takes one parameter.
#
# Lines `18-28` define method `stringy2`, which takes two paramters,
# one an optional parameter with a default value.
#
# On line `30`, method `stringy` is invoked with integer argument `6`. Within the
# method, local variable `length` is initialized to this value.
#
# On line `13`, local variable `output` is intialized to a string value that is
# returned by the expression `'10' * (length / 2)`. Here, `*` is
# syntactical sugar for the method call `10.*(length / 2)`. This method call
# returns string `'101010'`.
#
# On line `14`, in a ternary conditional statement (syntactical sugar replacing
# a multi-line `if/then` statement), method `odd?` is invoked on the value of
# `length`. In our case, this evaluates to false, so the string referenced
# by `output` is returned from the conditional. Since this is the last
# expression in method `stringy`, this is also the return value for the method.
#
# On line `30`, the return value of `stringy` ('101010') is sent as an argument
# to the `puts` method and is output. The return value of `puts` is nil, but
# this value is not used.
