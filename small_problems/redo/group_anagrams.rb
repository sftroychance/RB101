words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

# wordlist = words.each_with_object({}) do |word, hash|
#   key = word.split('').sort.join
#   if hash.key?(key)
#     hash[key].push(word)
#   else
#     hash[key] = [word]
#   end
# end

wordlist = words.group_by { |word| word.chars.sort }
wordlist.values.each { |val| p val }
