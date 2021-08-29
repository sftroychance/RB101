# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator. A user passes in two numbers, and the calculator will keep computing the sequence until limit is reached.
#
# Ben coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable. What's wrong with the code?
#
# limit = 15
#
# def fib(first_num, second_num)
#   while first_num + second_num < limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end
#
# result = fib(0, 1)
# puts "result is #{result}"
#
# How would you fix this so that it works?
# The problem is that the limit is defined outside the method, so that variable is not in scope within the method (it would return 'undefined local variable or method' error).  To work, the limit would need to be either (1) initiated within the method, or (2) passed to the method as an argument.

limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"
