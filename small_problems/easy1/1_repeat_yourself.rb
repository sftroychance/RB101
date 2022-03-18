# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# Example:

#   repeat('Hello', 3)

# Output:

#   Hello
#   Hello
#   Hello

def repeat(string, repetitions)
  repetitions.times { puts string }
end

repeat('Hello', 3)
repeat('Hi there', 8)

# edge cases
repeat('howdy', 0)
repeat('', 5)
repeat(3, 5)

# Lines `13-15` define a method `repeat` with two parameters.
#
# On line `17`, the repeat method is invoked with two arguments--a
# string `Hello` and integer `3`. Within the method, the string is assigned to
# local variable `string` and the integer is assigned to local variable
# `repetitions`.
#
# On line 14, the `Integer#times` method is invoked on the object
# referenced by `repetitions` with a `{}` block on the same line.
# The `#times` method executes the code in the block 3 times, and 'Hello' is
# output on three lines. The return value for the block is nil, but this value
# is not used. The return value of `#times` is the return value for
# the method, which is the value of `repetitions`, but this return value is not
# used.
