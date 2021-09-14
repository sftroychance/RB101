# Given a string that consists of some words (all lowercased) and an assortment
# of non-alphabetic characters, write a method that returns that string with all
# of the non-alphabetic characters replaced by spaces. If one or more
# non-alphabetic characters occur in a row, you should only have one space in
# the result (the result should never have consecutive spaces).
#
# Examples:
#
# cleanup("---what's my +*& line?") == ' what s my line '
#
=begin
P:
summary: a method that takes a string and returns the same string with non-alpha characters replaced by spaces
input: a string
output: a string

implicit rules:
explicit rules: no consecutive spaces in the output string, all alpha is lowercase

questions:

E:
cleanup('4830##@!abc**')
cleanup('abc') => test for no substitutions
D:

A:
1. write a method that takes a string parameter
2. substitute all non-alpha characters in the string with spaces
3. consolidate contiguous spaces
4. return the cleaned-up string

=end

def cleanup(string)
  string.gsub(/[^a-z]/, ' ').squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup('4830##@!ab c**')
p cleanup('abc')
