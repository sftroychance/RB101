# Write a method that returns a list of all substrings of a string. The returned
# list should be ordered by where in the string the substring begins. This means
# that all substrings that start at position 0 should come first, then all
# substrings that start at position 1, and so on. Since multiple substrings will
# occur at each position, the substrings at a given position should be returned
# in order from shortest to longest.
#
# You may (and should) use the leading_substrings method you wrote in the
# previous exercise:

def leading_substrings(str)
  output_arr = []

  (1..str.length).each do |ctr|
    output_arr << str.chars.first(ctr).join('')
  end

  output_arr
end

def substrings(str)
  sub_array = []

  str.chars.each_with_index do |chr, idx|
    sub_array << leading_substrings(str[idx..])
  end

  sub_array.flatten
end

p substrings('abcde') == [
   'a', 'ab', 'abc', 'abcd', 'abcde',
   'b', 'bc', 'bcd', 'bcde',
   'c', 'cd', 'cde',
   'd', 'de',
   'e'
 ]
