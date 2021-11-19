DIGIT_MAP = ('0'..'9').to_a

def integer_to_string(number)
  number.digits.reverse.map { |num| DIGIT_MAP[num] }.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
