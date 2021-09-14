# Write a method that takes a string with one or more space separated words and
# returns a hash that shows the number of words of different sizes.
#
# Words consist of any string of characters that do not include a space.
#
# Examples
#
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# word_sizes('') == {}
#
=begin
P:
summary: a method that takes a string of words and returns hash showing number of words of each size
input: a string
output: a hash

implicit rules: empty string returns empty hash
explicit rules: words-> any string of characters without a space

questions:

E:

D:
array to iterate over words
hash for output

A:
1. write method that takes a string parameter
2. split the string into an array of words
3. initialize empty hash
4. iterate over the words array
  a. get length of the word
  b. if length does not exist as a key in the hash, add it to the hash with value of 1
     if length does exist as key in hash, increment value by 1
5. return hash

=end

def word_sizes(string)
  string.split.each_with_object(Hash.new(0)) { |word, hash| hash[word.length] += 1 }
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
