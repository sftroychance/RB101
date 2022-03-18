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
  - define method triple_double that takes two integer parameters
  - split num1 into an array of digits
  - initialize a triples array
  - iterate over num1_digits
    - for each digit, multiply by 111
    - scan string equivalent of num1 for string equiv of that multiplied value
    - add digit to the triples
  - iterate over the triples Array
    - for each digit, multiply by 11
    - scan string equivalent of num2 for string equiv  of that multiple value
    - return 1 if a match is found
  - return 0
=end

def triple_double(num1, num2)
  num1_digits = num1.digits
  num1_digits.map!(&:to_s)

  triples = []

  num1_digits.each do |char|
    target = char * 3

    target_arr = num1.to_s.scan(target)
    if !target_arr.empty?
      triples << char
    end
  end

  return 0 if triples.empty?

  triples.uniq!

  triples.each do |char|
    target = char * 2

    target_arr = num2.to_s.scan(target)
    return 1 unless target_arr.empty?
  end

  return 0

end

p triple_double(451999277, 41177722899) == 1
p triple_double(1222345, 12345) == 0
p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1
p triple_double(10560002, 100) == 1
p triple_double(1112, 122) == 0
