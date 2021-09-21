# Given the array...
#
# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#           'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#           'flow', 'neon']
#
# Write a program that prints out groups of words that are anagrams. Anagrams
# are words that have the same exact letters in them but in a different order.
# Your output should look something like this:
=begin
P:
summary: given an array, print out groups of words that are anagrams of each other
input: an array
output: an array

implicit rules:
explicit rules:

questions:

E:

D:

A:
1. iterate over the array
   a. split the word into an array of characters and sort it
   b. iterate over the remainder of the array

first element - split word into sorted character array
  - compare it to the remaining words in the array
  - if the sorted character array matches, add the word to the current list

a method to test anagrams
=end

def anagram?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

results = []

words.each_with_index do |word, idx|
  next if word == nil

  list = []

  (idx...words.size).each do |inner_index|
    next if words[inner_index] == nil

    if anagram?(word, words[inner_index])
      list << words[inner_index]
      words[inner_index] = nil
    end
  end

  results << list.sort
end

results.each { |x| p x }
