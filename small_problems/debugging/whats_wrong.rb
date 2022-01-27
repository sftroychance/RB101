# The problem with the initial code was using p with a do/end block.
# The result we are getting is the same as doing arr.sort without
# the block; this is because the method call p arr.sort binds more
# tighty than the do/end block does to the sort method. We can fix this by
# assigning the value of the sort to a variable and then calling #p on
# that variable.
#
# Alternatively, as in the official method, we can fix this by putting
# parentheses around the arr.sort expression (including the block).
#
# This is a function of a method call (to #p) without using parentheses
# combined with using a do/end block as opposed to { }. The do/end
# block binds less tightly than the method binds to its arguments.
#

arr = ["9", "8", "7", "10", "11"]
# p arr.sort do |x, y|
result = arr.sort do |x, y|
    y.to_i <=> x.to_i
  end

p result

# Expected output: ["11", "10", "9", "8", "7"]
# Actual output: ["10", "11", "7", "8", "9"]
