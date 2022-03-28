# 3:35
# 3:47
=begin

Find the length of the longest substring in the given string that
is the same in reverse. If length of string is 0, return 0.

I: string
O: integer

R: if length of string is 0, return 0

D: array

A:
- def method that takes a string parameter
- initialize a candidates array
- obtain all substrings of string
  - iterate 1 to string.size, chars.each_cons(n) to append to candidates array
- flatten that array get unique values
- select test each value in candidates for whether it is a palindrome
  str == str.reverse
- map that array to the size of the strings
- return the maximum value
=end

def longest_palindrome(str)
  return 0 if str.size == 0

  candidates = []

  (1..str.size).each do |iter|
    candidates << str.chars.each_cons(iter).map(&:join)
  end

  candidates
    .flatten
    .uniq
    .select { |word| word == word.reverse }
    .map(&:length)
    .max
end


p longest_palindrome('a') == 1
p longest_palindrome('aa') == 2
p longest_palindrome('baa') == 2
p longest_palindrome('aab') == 2
p longest_palindrome('baabcd') == 4
p longest_palindrome('baablkj12345432133d') == 9
p longest_palindrome('') == 0

