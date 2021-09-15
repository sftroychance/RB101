# Write a method that takes an array of strings, and returns an array of the
# same string values, except with the vowels (a, e, i, o, u) removed.
#
# Example:
#
# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

=begin
P:
summary: a method that takes an array of strings and returns an array of the
same strings minus vowels
input: an array of strings
output: an array of the same strings with vowels removed

implicit rules:
explicit rules:

questions:

E:

D:
arrays

A:
1. write method with array parameter
2. iterate over array of strings
   a. delete all vowels in string
3. return array

=end

def remove_vowels(str_arr)
  str_arr.map { |str| str.delete("aeiouAEIOU") }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
