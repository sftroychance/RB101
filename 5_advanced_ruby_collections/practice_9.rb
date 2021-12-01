# Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.
#
# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

p arr.map(&:sort).map(&:reverse)

p arr.map { |subarr| subarr.sort { |a, b| b <=> a } }

# tried to do this:
# p arr.map do |subarr|
#     subarr.sort do |a, b|
#       b <=> a
#     end
#   end
#
# GOTCHA: the p statement binds more tightly to arr.map than does a do..end, so
# it returns an Enumerator. It works when using brackets on one line, as above.
# Best solution is to assign it to a variable and then print the variable. If it
# were within a method, I would just make the map statement the last statement
# in the method.
