# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.
#
# Examples:
#
# crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''
#
=begin
P:
summary: a method that takes a string and consolidates all repeating characters into one character
input: a string
output: a string with all consecutive duplicates conslidated

implicit rules: empty string returns empty string
explicit rules: don't use String#squeeze or String#squeeze!

questions:

E:

D:
array

A:
1. write a method that takes a string parameter
2. split the string into a character array
3. initialize a new array
4. iterate over the character array
   a. on the first iteration, append the character to the new array
   b. on remaining iterations, compare the current character to the last one
   c. if the character is the same as the last character, do nothing; if not,
   append the character to the new array.
5. return the new array

=end

def crunch(string)
  string.chars.each_with_object([]) { |c, arr| arr << c if c != arr.last }.join('')
  # or:
  # string.gsub(/(.)\1+/, '\1')
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
