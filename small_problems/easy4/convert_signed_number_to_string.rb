# Write a method that takes an integer, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

# Examples

# signed_integer_to_string(4321) == '+4321'
# signed_integer_to_string(-123) == '-123'
# signed_integer_to_string(0) == '0'

CHARS = ('0'..'9').to_a

def integer_to_string(num)
  str = ''

  if num < 10
    str = CHARS[num]
  else
    until num == 0
      num, remainder = num.divmod(10)
      str << CHARS[remainder]
    end
  end

  str.reverse
end

def signed_integer_to_string(num)
  sign_marker = num <=> 0

  str = integer_to_string(num.abs)

  case sign_marker
  when -1 then str.prepend('-')
  when 1 then str.prepend('+')
  end

  str
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
