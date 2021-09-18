# Write a method that returns a list of all substrings of a string that start at
# the beginning of the original string. The return value should be arranged in
# order from shortest to longest substring.
#
# Examples:
#
# leading_substrings('abc') == ['a', 'ab', 'abc']
# leading_substrings('a') == ['a']
# leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

=begin
P:
summary: A method that returns a list of substrings that start with the first
character of the string, ordered shortest to longetst substring
input: a string
output: an array of substrings

implicit rules:
explicit rules: order substrings shortest to longest

questions:

E:
leading_substrings('')

D:

A:
1. define a method with a string parameter
2. split the string into characters
3. iterate over the characters and return the substrings as they build up
4. return the array of substrings

=end

def leading_substrings(str)
  output_arr = []

  (1..str.length).each do |ctr|
    output_arr << str.chars.first(ctr).join('')
  end

  output_arr
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# a good one-line solution:
# str.chars.map.with_index { |c, i| str[0..i] }
