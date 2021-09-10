# What happens when we modify an array while we are iterating over it? What would be output by this code?
#
# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end
#
# =>
# 1
# 3
#
# What would be output by this code?
#
# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end
#
# =>
# 1
# 2
#
# We should not mutate an array while iterating over it as the results can be
# unpredictable; removing elements during iteration throws off the iterations
# because of changing indices and re-evaluation of the array size with each
# iteration.
#
# Originally expected that there would be nil values printed after the initial
# ones, but that was based on the false impression that each would attempt to
# iterate over the array based on the initial size. However, each reassesses the
# size of the collection at each iteration.
