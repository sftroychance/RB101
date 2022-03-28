# 1:12
# 1:28
=begin
given 2 strings, return true if there is a substring
(more than one letter long) that appears in both strings,
otherwise return false

I: two strings
O: boolean

R: substring must be >1 char
  - case insensitive

D: arrays

A:
- define method that takes two string parameters
- return false if [str1, str2].any? length < 2
- select shortest word of the two strings (min_by)
- initialize substrings array
- obtain all substrings of that word size > 1
  -iterate (2..shortest_word.size) each_with_object + each_cons(n)
  (other_str - not the shortest word)
- scan the other string for all those substrings
  - iterate over substrings
  - return true if scan of the substring in the longest string returns a value
- return false
=end

def substring_test(str1, str2)
  return false if [str1, str2].any? { |w| w.length < 2 }

  shortest, longest = [str1, str2].sort_by(&:length)

  substrings = []

  # note: don't need to check all substrings here
  # if a substring 3 characters long is found, you will have
  # already found a substring of two characters,
  # so we need only check for 2-character substrings
  #(2..shortest.size).each do |iter|
    substrings << shortest.chars.each_cons(2).map(&:join)
  #end

  substrings.flatten.each do |sub|
    return true if longest.downcase.scan(sub.downcase).size >= 1
  end

  false
end

p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', '111t') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItsAtrociou') == true
