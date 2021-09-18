# Write a method that takes a string as an argument and returns a new string in
# which every uppercase letter is replaced by its lowercase version, and every
# lowercase letter by its uppercase version. All other characters should be
# unchanged.
#
# You may not use String#swapcase; write your own version of this method.
#
# Example:
#
# swapcase('CamelCase') == 'cAMELcASE'
# swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
=begin
P:
summary: a method that swaps the cases of all letters in a string
input: a string
output: a new string

implicit rules:
explicit rules: all non-alpha characters should be unchanged

questions:

E:

D:
character array

A:
1. write a method that takes a string parameter
2. split the string into a character array
3. iterate over the character array
   a. if the character is uppercase, replace it with lowercase
   b. if the character is lowercase, replace it with uppercase
4. join the array into a new string
5. return the new string

=end

def swapcase(string)
  char_arr = string.chars.map do |char|
    case char
    when 'A'..'Z'
      char.downcase
    when 'a'..'z'
      char.upcase
    else
      char
    end
  end

  char_arr.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
