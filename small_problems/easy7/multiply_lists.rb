# Write a method that takes two Array arguments in which each Array contains a
# list of numbers, and returns a new Array that contains the product of each
# pair of numbers from the arguments that have the same index. You may assume
# that the arguments contain the same number of elements.
#
# Examples:
#
# multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
=begin
P:
summary: a method that takes 2 array parameters and returns a new array in which
each element represents multiplication of the elements of the corresponding
index.
input: 2 number arrays
output: a new array containing the products

implicit rules:
explicit rules: the array parameters contain the same number of arguments

questions:

E:

D:

A:
1. write a method that takes two array parameters
2. add the products of elements with corresponding indices to a new array
3. return the new array

=end

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |a| a.reduce(&:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
