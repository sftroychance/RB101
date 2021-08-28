# In the previous exercise, you developed a method that converts simple numeric strings to Integers. In this exercise, you're going to extend that method to work with signed numbers.

# Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

# You may assume the string will always contain a valid number.

# You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.

# Examples

# string_to_signed_integer('4321') == 4321
# string_to_signed_integer('-570') == -570
# string_to_signed_integer('+100') == 100

HEX = ('0'..'9').to_a + ('a'..'f').to_a

def string_to_signed_integer(str, str_base = 10)
  str_arr = str.chars.reverse
  neg_flag = false

  case str_arr.last
  when '+'
    str_arr.pop
  when '-'
    str_arr.pop
    neg_flag = true
  end

  int = 0
  str_arr.each_with_index do |char, idx|
    int += HEX.index(char) * str_base**idx
  end

  int = -int if neg_flag
  int
end

def hexadecimal_to_integer(str)
  string_to_integer(str.downcase, 16)
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
