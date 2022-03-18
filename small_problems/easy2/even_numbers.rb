# Print all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

puts (1..99).select(&:even?)

1.upto(99).each { |num| puts num if num.even? }

# On line `3`, range object `(1..99)` invokes method `Enumerable#select` with a
# block represented using syntactical sugar: `select(&:even?)` is syntatical
# sugar for `select { |value| value.even? }`. The `select` method returns an
# array containing elements for which the block returns a truthy value. The
# block returns the return value from method call `even?` for the value of the
# range in the current iteration. `select` returns an array of even values
# between 1 and 99 inclusive. i
#
# This array is then passed as an argument to the `puts` method, which outputs a
# string representation of each integer within the array, each on its own line.
#
# Line `5` is an alternate execution of the same code. The integer object `1`
# invokes the iterative `upto` method with an argument of `99`. (Note in this
# code `each` is superfluous because `upto` can be called with a block.) Leaving
# out `each`, `upto` is called with a block indicated in `{}` on the same line.
# Each integer value is passed to the block and assigned to local (block)
# variable `num`. `num` calls method `even?`, which returns a boolean value.
# Using an if modifier (syntactical sugar to replace a multi-line if statement),
# when the condition is true, `num` is passed as an argument to method `puts`,
# which outputs a string representation of the integer value with a newline
# character.
#
# The return value of `upto` is the calling object, integer 1, but this value is not
# used.
