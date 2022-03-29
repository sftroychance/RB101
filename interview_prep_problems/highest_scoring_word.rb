# 11:45
# 11:55
=begin
# Given a string of words, you need to find the highest scoring word.

# Each letter of a word scores points according to it’s position in the alphabet:
# a = 1, b = 2, c = 3 etc.

# You need to return the highest scoring word as a string.

# If two words score the same, return the word that appears earliest in the original string.

# All letters will be lowercase and all inputs will be valid.

I: string
O: string (highest-scoring word)

R: all lowercase and valid inputs
  if multiple words with highest score, return the first occurring

D: arrays

A:
- init method that takes one string parameter
- init an alpha array (constant) ('a' to 'z')
- split string into an array of words
- split words into arrays of characters (map)
- (map) and replace each element of each subarray with the letter scores
- (map) sum the values in each subarray
- get the first index of the largest sum
- return the word in the words array at that index

=end

ALPHA = ('a'..'z').to_a.prepend(' ')

def alphabet_score(str)
  comparison = str.split

  words = str
    .split
    .map! { |w| w.chars.map { |c| ALPHA.index(c) }.sum }

  words.each_with_index do |word, idx|
    return comparison[idx] if word == words.max
  end

end

p alphabet_score('man i need a taxi up to ubud') == 'taxi'
p alphabet_score('what time are we climbing up the volcano') == 'volcano'
p alphabet_score('take me to semynak') == 'semynak'
p alphabet_score('aa b') == 'aa'

