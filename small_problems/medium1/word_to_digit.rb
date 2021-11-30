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
