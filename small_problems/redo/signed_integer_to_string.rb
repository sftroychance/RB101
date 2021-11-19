DIGIT_MAP = ('0'..'9').to_a

def signed_integer_to_string(number)
  neg_flag = false

  if number < 0
    neg_flag = true
    number *= -1
  end

  str = number.digits.reverse.map { |num| DIGIT_MAP[num] }.join

  return str if str == '0'

  neg_flag ? '-' + str : '+' + str

end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
