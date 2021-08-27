# The || operator returns a truthy value if either or both of its operands are truthy. If both operands are falsey, it returns a falsey value. The && operator returns a truthy value if both of its operands are truthy, and a falsey value if either operand is falsey. This works great until you need only one of two conditions to be truthy, the so-called exclusive or.

# In this exercise, you will write a function named xor that takes two arguments, and returns true if exactly one of its arguments is truthy, false otherwise. Note that we are looking for a boolean result instead of a truthy/falsy value as returned by || and &&.

# Examples:

# xor?(5.even?, 4.even?) == true
# xor?(5.odd?, 4.odd?) == true
# xor?(5.odd?, 4.even?) == false
# xor?(5.even?, 4.odd?) == false

# Can you think of a situation in which a boolean xor method would be useful? Suppose you were modeling a light at the top of a flight of stairs wired in such a way that the light can be turned on or off using either the switch at the bottom of the stairs or the switch at the top of the stairs. This is an xor configuration, and it can be modeled in ruby using the xor method. Think of some additional examples.
#   You cast a valid vote in the election if you vote by mail or vote in person, but not both, and not neither.
#
# || and && are so-called short circuit operators in that the second operand is not evaluated if its value is not needed. Does the xor method perform short-circuit evaluation of its operands? Why or why not? Does short-circuit evaluation in xor operations even make sense?
#  There can't be a short-circuit evaluation for xor because it requires knowing the value of both operands.

def xor?(case1, case2)
  !!case1 != !!case2
end

p xor?(5.even?, 4.even?) # == true
p xor?(5.odd?, 4.odd?) # == true
p xor?(5.odd?, 4.even?) # == false
p xor?(5.even?, 4.odd?) # == false
p xor?(nil, 0) # == true
p xor?(5, 2) # == false
p xor?(nil, false) # == false
