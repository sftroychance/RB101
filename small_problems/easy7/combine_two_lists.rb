# Write a method that combines two Arrays passed in as arguments, and returns a
# new Array that contains all elements from both Array arguments, with the
# elements taken in alternation.
#
# You may assume that both input Arrays are non-empty, and that they have the
# same number of elements.
#
# Example:
#
# interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

=begin
P:
summary: a method that receives two arrays and combines their elements in
alternation to a new array
input: two arrays
output: an array

implicit rules:
explicit rules: received arrays are non-empty and have the same number of elements

questions:

E:

D:

A:
1. write a method that takes two array parameters
2. initialize output array
3. loop
   a. on each iteration, add the index value of each array to the new array
4. return new array

=end

def interleave(arr1, arr2)
  output_arr = []

  (0..(arr1.size - 1)).each { |x| output_arr << arr1[x] << arr2[x] }

  output_arr
end

# further exploration: use Array#zip
def interleave_alt(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

p interleave_alt([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
