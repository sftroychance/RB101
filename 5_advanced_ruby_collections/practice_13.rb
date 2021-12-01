# Given the following data structure, return a new array containing the same
# sub-arrays as the original but ordered logically by only taking into
# consideration the odd numbers they contain.
#
# arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
# The sorted array should look like this:
#
# [[1, 8, 3], [1, 6, 7], [1, 4, 9]]
#
# A: sort_by odd values.

def sort_by_odd(arr)
  arr.sort_by do |subarr|
    subarr.select do |num|
      num.odd?
    end
  end
end

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
arr2 = [[1, 3, 9], [2, 6, 4], [3, 6, 1]]

p sort_by_odd(arr)
p sort_by_odd(arr2)

# tested with other values to try to figure out exactly what is happening
# it seems the equivalent of reducing every array down to a single number
# containing only the odd digits and sorting numerically based on that:
# arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]] => [[17], [19], [13]]
#
# to test with number of more than one digit:

arr3 = [[91, 16, 27], [11, 14, 58], [51, 8, 23]]
p sort_by_odd(arr3)
