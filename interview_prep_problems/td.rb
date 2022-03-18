# 8:49


=begin
Write a function

triple_double(num1, num2)
which takes numbers num1 and num2 and returns 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2.

If this isn't the case, return 0

Examples
triple_double(451999277, 41177722899) == 1
# num1 has straight triple 999s and  num2 has straight double 99s

triple_double(1222345, 12345) == 0
# num1 has straight triple 2s but num2 has only a single 2

I: two numbers
O: 1 or 0

R: triple in num1, same digit double in num2
  num2 can have more than a double, as long a there is at least a double

A:
- convert both nums to strings
- initialize triples array
- iterate over num1- each_cons(3)
  - if a == b == c then append char to triples array
- iterate over triples array
  - if scan(char ** 2).size > 0
      return 1
- return 0

=end

def triple_double(num1, num2)
  num1 = num1.to_s
  num2 = num2.to_s

  triples = []

  num1.chars.each_cons(3) do |arr|
    if arr.uniq.size == 1
      triples << arr[0]
    end
  end

  triples.each do |char|
    return 1 if num2.scan(char * 2).size > 0
  end

  0
end

p triple_double(451999277, 41177722899) == 1
p triple_double(1222345, 12345) == 0
p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1
p triple_double(10560002, 100) == 1
p triple_double(1112, 122) == 0

