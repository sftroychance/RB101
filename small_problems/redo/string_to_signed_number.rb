DIGIT_MAP = ('0'..'9').to_a

def string_to_signed_number(str)
  prefix = ''

  if str[0] =~ /[+-]/
    prefix = str[0]
    str = str[1..]
  end

  number = str.chars.reverse.map.with_index do |digit, idx|
    DIGIT_MAP.index(digit) * (10 ** idx)
  end.sum

  prefix == '-' ? number * -1 : number

end

p string_to_signed_number('4321') == 4321
p string_to_signed_number('570') == 570
p string_to_signed_number('+570') == 570
p string_to_signed_number('-570') == -570
