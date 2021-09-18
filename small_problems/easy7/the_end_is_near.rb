# Write a method that returns the next to last word in the String passed to it as an argument.
#
# Words are any sequence of non-blank characters.
#
# You may assume that the input String will always contain at least two words.
#
# Examples:
#
# penultimate('last word') == 'last'
# penultimate('Launch School is great!') == 'is'

def penultimate(str)
  str.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
p penultimate('one')
p penultimate('')

# Suppose we need a method that retrieves the middle word of a phrase/sentence.
# What edge cases need to be considered? How would you handle those edge cases
# without ignoring them? Write a method that returns the middle word of a phrase
# or sentence. It should handle all of the edge cases you thought of.
#
# The edge cases here would be strings of less than 3 words and also sentences
# with even-numbered words; there is no specification for how to define the
# middle word when the number of words is even (would be a clarifying question).
#
# The edge cases below are 'handled' by returning nil when they are encountered.

def middle_word(str)
  arr = str.split
  return nil if arr.size < 3 || arr.size.even?
  arr[arr.size / 2]
end

p middle_word('one two three four five')
p middle_word('one two three four')
