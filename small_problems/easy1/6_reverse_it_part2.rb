# Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

# Examples:

#   puts reverse_words('Professional')          # => lanoisseforP
#   puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
#   puts reverse_words('Launch School')         # => hcnuaL loohcS

def reverse_words(string)
  string_arr = string.split
  string_arr.each { |word| word.reverse! if word.length >= 5 }
  string_arr.join(' ')
  # or to make it one line (we can chain method calls even with blocks):
  # string.split.map{ |word| word.length >= 5 ? word.reverse : word }.join(' ')
end 

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
