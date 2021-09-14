# Write a method that takes an Array of Integers between 0 and 19, and returns
# an Array of those Integers sorted based on the English words for each number:
#
# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven,
# twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen
#
# Examples:
#
# alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]
#
=begin
P:
summary: a method that receives an array of integers and returns the array sorted alphabetically by English word for that integer
input: array of integers
output: array of integers

implicit rules:
explicit rules:

questions:

E:

D:
array

A:
1. create a method that takes an array parameter
2. initialize an array constant sorted by English equivalents to integers
3. sort the received array keyed on the index of the reference array
4. return the sorted array
=end

CUSTOM_SORT = [ 8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
                6, 16, 10, 13, 3, 12, 2, 0 ]

def alphabetic_number_sort(arr)
  arr.sort_by { |a| CUSTOM_SORT.index(a) }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
