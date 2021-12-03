text = File.read('pg84.txt')
# sentences = text.split(/[\.\?!]/)
sentences = text.split(/(?<=[?.!])\s*/)
# a lookaround regex: splits on one or more spaces as long as they are preceded
# by ? or . or ! -- ?<= is for look-behind, enter lookbehind phrase in ()
largest_sentence = sentences.max_by { |sentence| sentence.split.size }
largest_sentence = largest_sentence.strip
number_of_words = largest_sentence.split.size

puts "#{largest_sentence}"
puts "Containing #{number_of_words} words"

# had an issue with this one at first with confusion over /r/n in the
# data file; turns out I could just ignore them.
