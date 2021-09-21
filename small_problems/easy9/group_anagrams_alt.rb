# Given the array...
#
# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#           'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#           'flow', 'neon']
#
# Write a program that prints out groups of words that are anagrams. Anagrams
# are words that have the same exact letters in them but in a different order.
# Your output should look something like this:
#
# ["demo", "dome", "mode"]
# ["neon", "none"]
# #(etc)

def anagram?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

result = {}

words.each do |word|
  key = word.chars.sort.join
  if result.key?(key)
    result[key] << word
  else
    result[key] = [word]
  end
end

result.values.each { |subarr| p subarr }
