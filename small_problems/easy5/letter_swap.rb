# Given a string of words separated by spaces, write a method that takes this
# string of words and returns a string in which the first and last letters of
# every word are swapped.
#
# You may assume that every word contains at least one letter, and that the
# string will always contain at least one word. You may also assume that each
# string contains nothing but words and spaces
#
# Examples:
#
# swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'

=begin
P:
summary: write a method that will reverse the first and last characters of every word in a string
input: a string
output: the same string with first and last characters of each word switched

implicit rules:
explicit rules: every word has at least one letter, every string at least one word

questions:

E:

D:
array

A:
1. write a method that takes a string parameter
2. split the string into words
3. iterate over each word and switch the first and last characters
4. convert the array back to a string.
5. return the string.
=end

def swap(string)
  string.split.each { |word| word[0], word[-1] = word[-1], word[0] }.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
