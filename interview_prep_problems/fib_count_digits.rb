#10:47
#11:09
=begin
Fibonacci numbers are generated by setting F0 = 0, F1 = 1, and then using the formula:

Fn = Fn-1 + Fn-2

Your task is to efficiently calculate the nth element in the Fibonacci sequence and then count the occurrence of each digit in the number. Return a list of integer pairs sorted in descending order.

10 ≤ n ≤ 100000

Examples

f(10) = 55  # returns [(2, 5)], as there are two occurances of digit 5

f(10000)    # returns:
  [(254, 3),
   (228, 2),
   (217, 6),
   (217, 0),
   (202, 5),
   (199, 1),
   (198, 7),
   (197, 8),
   (194, 4),
   (184, 9)]
If two integers have the same count, sort them in descending order.

Your algorithm must be efficient.

I: integer (nth element of fib)
O: array of arrays - each subarr contains # of occurrences of a digit and the digit

R: sort output in descending order by number of occurrences, followed by descending order by digit
D: array, hash

A:
- def method that takes an integer parameter
- calculate fibonacci for n
  - inject
- convert fibonacci solution to digits
- tally the digits
- convert tally to an array
- map the array to reverse the order of count and digit in the subarray
- sort descending on two criteria (sort ascending and reverse)
=end

def fib_digits(n)
  fibonacci = (2..n).inject([0, 1]) { |fib, _ | fib << fib.last(2).sum }

  fibonacci[n].digits
    .tally
    .to_a
    .map { |a, b| [b, a] }
    .sort_by { |a, b| [a, b] }
    .reverse
end

a = [[2, 5]]
p fib_digits(10) == a

a = [[254, 3],[228, 2],[217, 6],[217, 0],[202, 5],[199, 1],[198, 7],[197, 8],[194, 4],[184, 9]]
p fib_digits(10000) == a

a = [[2149, 2], [2135, 1], [2131, 8], [2118, 9], [2109, 0], [2096, 3], [2053, 5], [2051, 6], [2034, 7], [2023, 4]]
p fib_digits(100000) == a
