=begin
You are given an array (which will have a length of at least 3, but could be very large) containing integers. The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N. Write a method that takes the array as an argument and returns this "outlier" N.
Examples
[2, 4, 0, 100, 4, 11, 2602, 36]
Should return: 11 (the only odd number)
[160, 3, 1719, 19, 11, 13, -21]
Should return: 160 (the only even number)

I: array of integers
O: an integer

A:
- write a method that takes an array parameter
- partition the array into even and odd values
- return the first (only) value from whichever resultant array has size == 1
=end

def outlier(arr)
#   if arr.count(&:odd?) > 1
#     arr.select! { |x| x.even? }
#   else
#     arr.select! { |x| x.odd? }
#   end
#
#   arr[0]

  odd, even = arr.partition { |x| x.odd? }

  odd.size == 1 ? odd[0] : even[0]
end

p outlier([2, 4, 0, 100, 4, 11, 2602, 36]) == 11
p outlier([160, 3, 1719, 19, 11, 13, -21]) == 160
