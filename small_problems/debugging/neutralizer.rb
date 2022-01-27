# The problem with the original code is that we are modifying
# an array while it is being iterated over with #each; every
# time a deletion is made, the size of the words array changes
# and the iteration count is thrown off, so it will not delete
# consistently. This can be remedied by using #reject!

def neutralize(sentence)
  words = sentence.split(' ')
  # words.each do |word|
  #   words.delete(word) if negative?(word)
  # end

  words.reject! { |word| negative?(word) }

  words.join(' ')
end

def negative?(word)
  ['dull',
   'boring',
   'annoying',
   'chaotic'].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.
