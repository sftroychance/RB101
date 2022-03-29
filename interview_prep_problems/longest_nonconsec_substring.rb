# 12:01
# 12:09
#  Given a string as input, find the longest substring that does not have any consecutive repeating characters.
=begin
I: string
O: string

R:

D: array

A:
- init method that takes one string parameter
- get all substrings
  - initialize a candidates array
  - iterate 1 to string size
    - append sets of n-size substrings to candidates array
  - flatten candidates array
- iterate (reject) to get rid of substrings with repeated characters (regex)
- substring array max by length of the substring
=end

def find_longest_substring(string)
  candidates = []

  (1..string.size).each do |length|
    candidates << string.chars.each_cons(length).map(&:join)
  end

  candidates
    .flatten
    .reject { |word| word =~ /(.)\1/ }
    .max_by(&:length)
end

p find_longest_substring('aaaaa') == 'a'
p find_longest_substring('aaaaaazz') == 'az'
p find_longest_substring('bookkeeper') == 'eper'
p find_longest_substring('leetucebox') == 'etucebox'

