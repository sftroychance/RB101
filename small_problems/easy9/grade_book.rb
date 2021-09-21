# Write a method that determines the mean (average) of the three scores passed
# to it, and returns the letter value associated with that grade.
#
# Numerical Score Letter	Grade
# 90 <= score <= 100	'A'
# 80 <= score < 90	'B'
# 70 <= score < 80	'C'
# 60 <= score < 70	'D'
# 0 <= score < 60	'F'
#
# Tested values are all between 0 and 100. There is no need to check for
# negative values or values greater than 100.
#
# Further exploration: How would you handle this if there was a possibility of
# extra credit grades causing it to exceed 100 points? set an infinite upper
# range for the 'A' condition.

def get_grade(g1, g2, g3)
  avg = (g1 + g2 + g3) / 3.0

  case avg.round
  when 90..    then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  else              'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(100, 102, 103)
