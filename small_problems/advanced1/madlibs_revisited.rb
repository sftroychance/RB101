# Make a madlibs program that reads in some text from a text file that you have
# created, and then plugs in a selection of randomized nouns, verbs, adjectives,
# and adverbs into that text and prints it. You can build your lists of nouns,
# verbs, adjectives, and adverbs directly into your program, but the text data
# should come from a file or other external source. Your program should read
# this text, and for each line, it should place random words of the appropriate
# types into the text, and print the result.
#

f = File.open('text.txt')

adv = %w(slowly gradually finally always briefly carefully rudely)
adj = %w(adorable blue wild special foolish huge fierce exciting)
noun = %w(house suitcase desk soda computer car highway building)
verb = %w(fly snore locate explain bite get laugh change)

f.each do |line|
  line.chomp!
  puts eval("\"" + line + "\"")
end

