=begin
You are given a secret message you need to decipher. Here are the things you need to know to decipher it:
For each word:
the second and the last letter is switched (e.g. Hello becomes Holle)
the first letter is replaced by its character code (e.g. H becomes 72)
Note: there are no special characters used, only letters and spaces
Examples
decipherThis('72olle 103doo 100ya'); // 'Hello good day'
decipherThis('82yade 115te 103o'); // 'Ready set go'

I: a string
O: a string

R: first letter is char code
  second and last letters are switched
  only letters and spaces used

D: array

A:
- define method with one string parameter
- split string into array of words
- map over words array
  - word[0] = word[0].chr
  - word[1], word[-1] = word[-1], word[1]
- join and return string

=end

def decipher_this(str)
  words = str.split

  words.map! do |word|
    first = word.to_i.chr
    word.sub!(word.to_i.to_s, '')
    word = word.chars
    word[0], word[-1] = word[-1], word[0]
    word.prepend(first).join
  end

  words.join(' ')
end

p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"
