# Write a method that returns a list of all substrings of a string that are
# palindromic. That is, each substring must consist of the same sequence of
# characters forwards as it does backwards. The return value should be arranged
# in the same sequence as the substrings appear in the string. Duplicate
# palindromes should be included multiple times.
#
# You may (and should) use the substrings method you wrote in the previous
# exercise.
#
# For the purposes of this exercise, you should consider all characters and pay
# attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor
# "Abc-bA" are. In addition, assume that single characters are not palindromes.
#

=begin
P:
summary: a method that returns all palindromic substrings of a string
input: a string
output: an array containing all palindromic substrings

implicit rules:
explicit rules: include duplicates, case-sensitive, consider all characters,
output array must be in the same order in which the palandromic substrings are
encountered.

questions:

E:

D:

A:
1. write a method that takes a string parameter
2. obtain all substrings of the string
3. initialize output array
4. test each substring for whether it is a palindrome
   a. append substring to output array if it is a palindrome
5. return output array

=end

def leading_substrings(str)
  output_arr = []

  (1..str.length).each do |ctr|
    output_arr << str.chars.first(ctr).join('')
  end

  output_arr
end

def substrings(str)
  sub_array = []

  str.chars.each_with_index do |_, idx|
    sub_array << leading_substrings(str[idx..])
  end

  sub_array.flatten
end

def palindrome?(str)
  str == str.reverse && str.length > 1
end

def palindromes(str)
  # further exploration: uncomment below to ignore case and ignore non-alphanumerics
  # str.downcase!
  # str.gsub!(/[^a-zA-Z0-9]/, ' ')

  substrings = substrings(str)

  substrings.select { |sub| palindrome?(sub) }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
# # tests for further exploration
# p palindromes('Madam')
# p palindromes('*Madam.:mom')
