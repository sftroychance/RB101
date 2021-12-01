# Using the each method, write some code to output all of the vowels from the strings.
#
# hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
#
# A: iterate over hash, iterate over the values arrays, append vowels to output
# array
#
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

output = []

hsh.each do |_, subarr|
  subarr.each do |word|
    output << word.scan(/[aeiou]/)
  end
end

p output.flatten

# the official solution iterated over each word to break it down into characters
# the solution did not indicate how to output, so I did it by array
# the solution mentioned Hash#values a an option:

output2 = []
hsh.values.each do |subarr|
  subarr.each do |word|
    output2 << word.scan(/[aeiou]/)
  end
end

puts output2

# or the most brief (join works recursively for nested arrays)
#
puts '-----'
puts hsh.values.join.scan(/[aeiou]/)
