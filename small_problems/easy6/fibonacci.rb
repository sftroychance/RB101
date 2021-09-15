# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...)
# such that the first 2 numbers are 1 by definition, and each subsequent number
# is the sum of the two previous numbers. This series appears throughout the
# natural world.
#
# Computationally, the Fibonacci series is a very simple series, but the results
# grow at an incredibly rapid rate. For example, the 100th Fibonacci number is
# 354,224,848,179,261,915,075 -- that's enormous, especially considering that it
# takes 6 iterations before it generates the first 2 digit number.
#
# Write a method that calculates and returns the index of the first Fibonacci
# number that has the number of digits specified as an argument. (The first
# Fibonacci number has index 1.)
#
# Examples:
#
# find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# find_fibonacci_index_by_length(10) == 45
# find_fibonacci_index_by_length(100) == 476
# find_fibonacci_index_by_length(1000) == 4782
# find_fibonacci_index_by_length(10000) == 47847
#
# You may assume that the argument is always greater than or equal to 2.

=begin
P:
summary: a method that receives an number and calculates the index of the first
number in the fibonacci series to contain that many digits
input: an integer
output: an integer indicating the index

implicit rules:
explicit rules: the integer received is >= 2

questions:

E:

D:
array

A:
1. create method that takes an integer parameter
2. create a loop
   a. populate a fibonacci array
   b. break with index when the current value has a length equal to the given integer value
3. return index

=end

def find_fibonacci_index_by_length(length)
  fibonacci = [1, 1]
  for x in (2..) do
    fibonacci << fibonacci[x - 2] + fibonacci[x - 1]
    break fibonacci.size if fibonacci.last.to_s.size == length
  end
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(3) == 12
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
