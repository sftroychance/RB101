# Write a method that takes an Array as an argument, and reverses its elements
# in place; that is, mutate the Array passed into this method. The return value
# should be the same Array object.
#
# You may not use Array#reverse or Array#reverse!.
#
=begin
P:
summary: a method that takes an array and reverses the order of its elements by mutating the array
input: an array
output: the same array, mutated, order of elements reversed

implicit rules:
explicit rules: do not use Array#reverse or Array#reverse!

questions:

E:

D:
array

A:
1. write method that takes an array parameter
2. loop over the first half of the array
   a. switch the current element with the element the same distance from the end of the array
3. return the mutated array

=end

def reverse!(arr)

  for idx in 0..(arr.size / 2 - 1)
    arr[idx], arr[-idx - 1] = arr[-idx - 1], arr[idx]
  end

  arr
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true
