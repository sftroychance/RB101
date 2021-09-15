# Write a method that takes two Arrays as arguments, and returns an Array that
# contains all of the values from the argument Arrays. There should be no
# duplication of values in the returned Array, even if there are duplicates in
# the original Arrays.

=begin
P:
summary: a method that receives two arrays and returns a combined array with no duplicates
input: two arrays
output: combined array without duplicates

implicit rules:
explicit rules: remove duplicates even if original arrays had duplicates

questions:

E:

D:
arrays

A:
1. write a method that takes two arrays as parameters
2. combine the arrays
3. remove duplicate values from the combined array
4. return new array

=end

def merge (arr1, arr2)
  (arr1 + arr2).uniq # also: arr1 | arr2 => union of arrays, no duplicates
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

