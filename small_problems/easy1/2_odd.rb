# Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

# Examples:

#   puts is_odd?(2)    # => false
#   puts is_odd?(5)    # => true
#   puts is_odd?(-17)  # => true
#   puts is_odd?(-8)   # => false
#   puts is_odd?(0)    # => false
#   puts is_odd?(7)    # => true

# Keep in mind that you're not allowed to use #odd? or #even? in your solution.

def is_odd?(num)
  num.abs % 2 == 1
end 

# example cases
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

# Further Exploration

# This solution relies on the fact that % is the modulo operator in Ruby, not a remainder operator as in some other languages. Remainder operators return negative results if the number on the left is negative, while modulo always returns a non-negative result if the number on the right is positive.

# modulo	          remainder
# 5 mod 2 == 1	    5 rem 2 == 1
# -5 mod 2 == 1	    -5 rem 2 == -1
# 5 mod -2 == -1    5 rem -2 == 1
# -5 mod -2 == -1	  -5 rem -2 == -1
# If you weren't certain whether % were the modulo or remainder operator, how would you rewrite #is_odd? so it worked regardless?

# The Integer#remainder method performs a remainder operation in Ruby. Rewrite #is_odd? to use Integer#remainder instead of %. Note: before version 2.4, Ruby used the Numeric#remainder method instead.

def is_odd2?(num)
  num.abs.remainder(2) == 1
end

# example cases
puts is_odd2?(2)    # => false
puts is_odd2?(5)    # => true
puts is_odd2?(-17)  # => true
puts is_odd2?(-8)   # => false
puts is_odd2?(0)    # => false
puts is_odd2?(7)    # => true
