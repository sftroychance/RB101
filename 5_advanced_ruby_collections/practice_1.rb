# How would you order this array of number strings by descending numeric value?
# arr = ['10', '11', '9', '7', '8']
#
# A: These are strings, so do a sort_by keyed on the to_i value of the string,
# then reverse the array. Test if it is possible to do a sort_by then a sort
# method that reverses the sort order.

arr = ['10', '11', '9', '7', '8']

p arr.sort_by { |x| x.to_i }.reverse # this works

p arr.sort_by { |x| x.to_i }.sort { |a, b| b <=> a } # does not work (sort is still sorting strings)

p arr.sort { |a, b| b.to_i <=> a.to_i } # this does work and is the official solution

p arr.sort_by(&:to_i).reverse # this does work
