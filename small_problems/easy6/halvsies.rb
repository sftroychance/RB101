# Write a method that takes an Array as an argument, and returns two Arrays (as
# a pair of nested Arrays) that contain the first half and second half of the
# original Array, respectively. If the original array contains an odd number of
# elements, the middle element should be placed in the first half Array.

=begin
P:
summary: method takes an array as an argument and returns two halves of the array nested in a new array
input: an array
output: a two-element nested array

implicit rules:
explicit rules: the middle element should be placed in the first array if size is odd

questions:

E:

D:
arrays

A:
1. write a method that takes an array parameter
2. initialize a new array containing two subarrays
3. split the original array into the two subarrays
4. return the new nested array

=end

def halvsies(arr)
  output_arr = []
  midpoint = (arr.size / 2.0 ).ceil

  output_arr[0] = arr[0...midpoint]
  output_arr[1] = arr[midpoint..]

  output_arr
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
