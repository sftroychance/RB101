# Write a method that takes an Array of numbers and then returns the sum of the
# sums of each leading subsequence for that Array. You may assume that the Array
# always contains at least one number.
#
# Examples:
#
# sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# sum_of_sums([4]) == 4
# sum_of_sums([1, 2, 3, 4, 5]) == 35
=begin
P:
summary: a method that takes an array of numbers, returns sum of sums of each
leading subsequence in that array
input: an array
output: an integer

implicit rules:
explicit rules: the array parameter contains at least one number

questions: what is a sum of leading subsequence? for each element, you get the
sum of that element plus all the previous elements

E:
sum_of_sums([])
sum_of_sums([0])

D:

A:
1. write a method that takes an array parameter
2. initialize an integer sum variable
3. iterate over the array
   a.  on the first iteration, add the value to the sum
   b. on subsequent iterations, add the value to the value at the previous index and add that to the sum
4. return the sum

=end

def sum_of_sums(arr)
  sum = 0

  (1..arr.size).each do |ctr|
    sum += arr.first(ctr).sum
  end

  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
p sum_of_sums([]) == 0
p sum_of_sums([0]) == 0
