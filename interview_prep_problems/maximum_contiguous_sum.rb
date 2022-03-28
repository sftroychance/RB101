#11:37
#11:50
=begin

I: array of integers
O: an integer - the maximum sum of a subsequence

R: empty array -> returns 0
  all negative numbers -> return 0

D: arrays

A:
- define method that takes an array parameter
- return 0 for an empty array
- return 0 for an array of all negative numbers
- get all subsequences
  - initialize a candidates array
  - iterate over 1..array.size (n)
    - get consective values of size n (each_cons(n))
    - add each subsequence to the candidates array
- map the candidates array the the sum of each subarray
- return maximum sum
=end

def max_sequence(numbers)
  candidates = [0]

  (1..numbers.size).each { |iter| candidates << numbers.each_cons(iter).map(&:sum) }

  candidates.flatten.max
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
p max_sequence([-2, -3, -1]) == 0
