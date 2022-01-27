# In the original code, the conditional in the ternary expression
# was given as 'odd_count = 3', which is an assignment that will
# always return a truthy value; the = must be changed to ==. Also,
# for refactoring, we don't need the ternary expression since the
# conditional itself will return true or false; in facet, we don't
# need the assignment to odd_count if we use the calculation in
# the conditional. Further, it can be reduced to one line without
# the necessary return statement.
#
# Per rubocop, #count should take &:odd? rather than the block

def valid_series?(nums)
  # return false if nums.sum != 47

  # odd_count = nums.count { |n| n.odd? }
  # odd_count = 3 ? true : false
  # odd_count  == 3 ? true : false
  # nums.sum == 47 && nums.count { |n| n.odd? } == 3
  nums.sum == 47 && nums.count(&:odd?) == 3
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])        # should return true
p valid_series?([1, 12, 2, 5, 16, 6])             # should return false
p valid_series?([28, 3, 4, 7, 9, 14])             # should return false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])        # should return true
p valid_series?([10, 6, 19, 2, 6, 4])             # should return false
