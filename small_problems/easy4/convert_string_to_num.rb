# The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby to convert a string to a number, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

# Examples

# string_to_integer('4321') == 4321
# string_to_integer('570') == 570

HEX = ('0'..'9').to_a + ('a'..'f').to_a

def string_to_integer(str, str_base = 10)
  str_arr = str.chars.reverse

  int = 0
  str_arr.each_with_index do |char, idx|
    int += HEX.index(char) * str_base**idx
  end

  int
end

def hexadecimal_to_integer(str)
  string_to_integer(str.downcase, 16)
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

p hexadecimal_to_integer('4D9f') == 19871
