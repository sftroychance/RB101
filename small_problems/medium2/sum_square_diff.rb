# Write a method that computes the difference between the square of the sum of
# the first n positive integers and the sum of the squares of the first n
# positive integers.
#
# Examples:
# sum_square_difference(3) == 22     # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# sum_square_difference(10) == 2640
# sum_square_difference(1) == 0
# sum_square_difference(100) == 25164150
=begin
P:
summary: a method that calcalates (first(n).sum**2) - (first(n)**2).sum
input: an integer
output: result of the differerence calculation

implicit rules:
explicit rules:

questions:

E:


D:


A:
- find sum of first n digits and square it
- find sum of first n digits squared
- subtract and return difference

=end

def sum_square_difference(num)
  arr = (1..num).to_a

  square_of_sum = arr.sum**2
  sum_of_squares = arr.map { |x| x**2 }.sum

  square_of_sum - sum_of_squares
end

p sum_square_difference(3) == 22     # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
