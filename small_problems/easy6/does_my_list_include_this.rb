# Write a method named include? that takes an Array and a search value as
# arguments. This method should return true if the search value is in the array,
# false if it is not. You may not use the Array#include? method in your
# solution.
=begin
P:
summary: a method that receives an array and search value, returns true if the array contains the search value
input: an array and search value
output: a boolean

implicit rules:
explicit rules: do not use Array#include

questions:

E:

D:

A:
1. create method with Array and one other parameter
2. iterate over the array
   a. return true if value found
3. return false if value not found

=end

def include?(arr, target)
  # official solution: !!array.find_index(value)
  arr.each { |x| return true if x == target }
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
