# Write a method that takes a string argument, and returns true if all of the
# alphabetic characters inside the string are uppercase, false otherwise.
# Characters that are not alphabetic should be ignored.

def uppercase?(str)
  str == str.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# Food for thought: in our examples, we show that uppercase? should return true
# if the argument is an empty string. Would it make sense to return false
# instead? Why or why not?
#
# I think it makes more sense to return true. String#upcase will return the
# the empty string (as opposed to throwing an error or returning nil), so I think
# returning true here is most consistent with the existing method.
