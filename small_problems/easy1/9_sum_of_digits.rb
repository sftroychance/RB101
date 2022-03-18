# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

# Examples:

# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45

# The tests above should print true.

# For a challenge, try writing this without any basic looping constructs (while, until, loop, and each).

def sum(number)
  number.digits.sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# Lines `13-15` define method `sum`, which takes a parameter.
#
# On line `17`, method `sum` is invoked with integer value `23` as an
# argument. Within the method, at line `13`, local variable `number` is
# initialized to this integer value.
#
# On line `14`, the integer referenced by `number` invokes method `digits`,
# which returns an array object [3, 2]. That array object in turn calls method
# `sum`, which returns the value 5; as this is the last statement within the
# method, 5 is also the return value for method `sum`.
#
# On line `17`, the return value is compared to integer `5` with ==; this is
# syntactical sugar for `sum(23).==(5)`, This method return the boolean value
# true, which is passed as an argument to method `puts`, which outputs the
# string representation of the boolean value, which is `'true'`.
