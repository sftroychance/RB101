# Write a method that takes two Array arguments in which each Array contains a
# list of numbers, and returns a new Array that contains the product of every
# pair of numbers that can be formed between the elements of the two Arrays. The
# results should be sorted by increasing value.
#
# You may assume that neither argument is an empty Array.
#
# Examples:
#
# multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
=begin
P:
summary: a method that receives 2 arrays and returns a new array with products of all pair combinations of first-array elements with second-array elements
input: two arrays of numbers
output: a new array containing the products

implicit rules:
explicit rules: neither parameter array is empty

questions:

E:

D:

A:
1. write a method that takes two array paramters
2. multiply each element of the first array by each element of the second
   a. add results to new array
3. return new array

=end

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |a| a.reduce(&:*) }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
