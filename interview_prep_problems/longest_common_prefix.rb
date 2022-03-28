=begin
find longest common prefix string amongst an array of strings
if there is no common prefix, return empty string ''
all inputs are lowercase

I: array of strings
O: a string - longest common prefix

R: all inputs are lowercase
  return '' if no common prefix

D: arrays

A:
- define method that takes an array parameter
- obtain one word of the shortest length (min_by)
- delete that word from the array
- initialize a prefix string
- iterate over all the characters of the shortest word with index
  - prefix << char if all elements of the array have that character at that index
    (string.all?)
    - otherwise break
- return prefix string

refactoring:
  - find length of shortest word in the array
  - iterate over the indices 0 to shortest_length exclusive
    - append character to prefix if all chars at that index are equal
=end

def common_prefix(words)
  # test_word = words.min_by(&:length)
  # words.delete_at(words.index(test_word))

  prefix = ''

  # test_word.chars.each_with_index do |char, idx|
  #  prefix << char if words.all? { |w| w[idx] == char }
  # end
  min_length = words.min_by(&:length).length
  (0...min_length).each do |idx|
    if words.all? { |w| w[idx] == words[0][idx]}
      prefix << words[0][idx]
    else
      return prefix
    end
  end

  prefix
end


p common_prefix(['flower', 'flow', 'flight']) == 'fl'
p common_prefix(['dog', 'racecar', 'car']) == ''
p common_prefix(['interspecies', 'interstellar', 'interstate']) == 'inters'
p common_prefix(['throne', 'dungeon']) == ''
p common_prefix(['throne', 'throne']) == 'throne'




