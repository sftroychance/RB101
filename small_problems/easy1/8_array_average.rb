# Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

# Examples:

# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

# The tests above should print true.

def average(numbers)
  numbers.sum / numbers.size
end

def average_float(numbers)
  numbers.sum.to_f / numbers.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

puts average_float([1, 6])
puts average_float([1, 5, 87, 45, 8, 8])
puts average_float([9, 47, 23, 95, 16, 52])

# Lines `11-13` define method `average`, which takes one parameter.
#
# Lines `15-17` denote method `average_float`, which takes one parameter.
#
# On line `19`, the method `average` is invoked with an array object `[1, 6]`
# as an argument. Within the method, local variable `numbers` is assigned to
# the same array object.
#
# On line `12`, the array object referenced by `numbers` invokes the method
# `sum`, which returns 7 Using the syntactical sugar with `/` as an operator,
# 3 invokes method `/` with the argument being the return value of
# `numbers.size` (e.g., `3./(numbers.size)). The return value of method
# invocation `numbers.size` is 2, so the return value of the entire expression
# (and, implicitly, the `average` method) is 3, the result of integer division 7
# / 2.
#
# On line `19`, the return value of `average` is compared to integer value 3;
# the comparison indicate is syntactical sugar for the method call
# `average([1,6]).==(3)`. This method call returns true, which is passed as an
# argument to the method `puts`. Method `puts` calls the `to_s` method on its
# arguments (TrueClass#to_s), so here it outputs the string value 'true'.
