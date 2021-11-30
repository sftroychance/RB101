text = File.read('pg84.txt')
# sentences = text.split(/[\.\?!]/)
sentences = text.split(/(?<=[?.!])\s*/)
largest_sentence = sentences.max_by { |sentence| sentence.split.size }
largest_sentence = largest_sentence.strip
number_of_words = largest_sentence.split.size

puts "#{largest_sentence}"
puts "Containing #{number_of_words} words"
