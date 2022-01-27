# In the original code (commented out below), we attempt to add
# a string to an array, but it needs to be properly concatenated
# to the array (we get a TypeError otherwise).
# Since we want to add the word to the beginning # of the array,
# #unshift would be a good method to call for this.
#
# refactoring note: rather than keeping track of an index counter,
# we can iterate directly over the words array.
#

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  #   i = 0
  #   while i < words.length
  #     # reversed_words = words[i] + reversed_words
  #     reversed_words.unshift(words[i])
  #     i += 1
  #   end
  #

  words.each { |word| reversed_words.unshift(word) }

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'
