=begin
P:
summary: given a string, replace the word forms of digit with the digits
input: a string
output: the same string with digit words replaced with digits

implicit rules:
explicit rules:

questions:

E:
word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
word_to_digit('')

D:
array to tokenize string and replace words

A:
map digit words to digits in a constant
split string into words
iterate over words
  replace digit words with digits
return string

=end

DIGIT_WORDS = %w(zero one two three four five six seven eight nine)

def word_to_digit(str)
  lines = str.split('.')
  output = ''

  lines.each do |line|
    line.split.each do |word|
      if DIGIT_WORDS.include?(word.downcase)
        output << DIGIT_WORDS.index(word.downcase).to_s
      else
        output << word + ' '
      end
    end

    output.strip!
    output << '. '
  end
  output.strip!

  output.gsub!(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
end

str = 'Please call me at 5 at four one five five five five one two three four. Thanks.'
p word_to_digit(str)

# On line `28`, constant variable `DIGIT_WORDS` is initialized to an array
# object containg string elements.
#
# Lines `30-49` define method `word_to_digit`, which takes one parameter.
#
# On line `51`, local variable `str` is initialized to a string object.
#
# On line `52`, method `word_to_digit` is invoked with `str` passed to it as an
# argument.  At line 30, local variable `str` is initialized to point to the
# same string object; now both `str` in the main program and `str` in the
# `word_to_digit` method point to the same string object, but they are different
# variables occupying different scope.
#
# On line `31`, the `split` method is invoked by the string object referenced by
# `str`, with the argument `'.'`. Local variable `lines` is initialized to the
# array object returned by this method.
#
# On line `32`, local variable `output` is initialized to a string object with the
# value `''`.
#
# On line `34`, the `each` method is invoked by the object referenced by `lines`,
# with a `do..end` block defined on lines `34-45` passed as an argument, taking
# one parameter. For each iteration, an element of array `lines` is passed to the block and
# assigned to block variable `line`.
#
# On line `35`, the string object referenced by `line` invokes the `split`
# method, which returns an array of strings, and this array in turn invokes the
# method `each` with a `do..end` block defined on lines `34-40` passed as an
# argument, takin one block parameter. For each iteration an element of array
# `line` is passed to the block and assigned to the block variable `word`.
#
# On line `36`, in a conditional statement, the method `include?` is invoked
# on the string array referenced by `DIGIT_WORDS`; passed to this method as an
# argument is the return value of method `downcase` invoked on the string object
# referenced by `word`.
#
# If this conditional evaluates to true, the method
# `index` is invoked on the array object referenced by `DIGIT_WORDS`, with the
# return value of the `downcase` method invoked on the object referenced by
# `word` passed as an argument, which in turn invokes method `to_s`. The return
# value of this method call is appended to the string object referenced by
# `output` via method `<<`. If the conditional evaluates to false, the string object referenced
# by `word` appended to string `' '` is appended to the `outlet` string object.
#
# On line `43`, the destructive method `strip!` is invoked on the string object
# referenced by `output`, which is modified in place. On line 44, the `output`
# string object is appended with string `'. '`.
#
# On line `46`, after all elements of `line` have been iterated over,
# destructive method `strip!` is invoked on the object referenced by `output`,
# and this object is modified in place.
#
# On line `48`, destructive method `gsub!` is invoked on string object `output`,
# with a regex value and replacement regex (to format the string as a phone
# number) passed to it as an argument. As this is the last statement in method
# 'word_to_digit`, the return value of `gsub!` is also the return value of this
# method.
#
# On line `52`, the return value of `word_to_digit` is passed to method `p` and
# is output.
