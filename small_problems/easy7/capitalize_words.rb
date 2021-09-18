# Write a method that takes a single String argument and returns a new string
# that contains the original value of the argument with the first character of
# every word capitalized and all other letters lowercase.
#
# You may assume that words are any sequence of non-blank characters.
#
# Examples
#
# word_cap('four score and seven') == 'Four Score And Seven'
# word_cap('the javaScript language') == 'The Javascript Language'
# word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

=begin
P:
summary: a method that takes a string and returns the same string with all words
capitalized
input: a string
output: a new string with all the words in the input string capitalized

implicit rules: a word that starts with a non-word character will not have the
first word capitalized
explicit rules: a word is any sequence of non-blank
characters

questions:

E:
word_cap('')

D:

A:
1. write a method that takes a string argument
2. split string into an array of words
3. capitalize each word
4. join the words into a new string
5. return the new string

=end

def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

def word_cap_2(string)
  string.downcase.split.each { |word| word[0] = word[0].upcase }.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

p word_cap_2('four score and seven') == 'Four Score And Seven'
p word_cap_2('the javaScript language') == 'The Javascript Language'
p word_cap_2('this is a "quoted" word') == 'This Is A "quoted" Word'
