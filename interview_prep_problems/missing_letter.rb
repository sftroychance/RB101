=begin
Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter in the array.
You will always get an valid array. And it will be always exactly one letter be missing. The length of the array will always be at least 2.
The array will always contain letters in only one case.
Example:
['a','b','c','d','f'] -> 'e' ['O','Q','R','S'] -> 'P'
["a","b","c","d","f"] -> "e"
["O","Q","R","S"] -> "P"
(Use the English alphabet with 26 letters!)

I: array
O: a string

R: exactly one letter missing
array size at least 2

A:
- create a method taking one array parameter
- initialize an array using the range array[0]..array[-1]
- subtract the initial array from the new array
- return the remaining character

=end

def missing_letter(arr)
  full_array = (arr[0]..arr[-1]).to_a
  missing = full_array - arr
  missing[0]
end

p missing_letter(['a', 'b', 'c', 'd', 'f']) == 'e'
p missing_letter(['O', 'Q', 'R', 'S']) == 'P'
