# 2:59
# 3:02
=begin
write a method that takes 2 strings and returns true if a portion
of the string 1 characters can be rearranged to match string 2,
otherwise false
only lowercase letters used

I: two strings
O: boolean

R: only lowercase letters used

D: array

A:
- define method that takes two string parameters
- iterate over unique characters of string 2
  - return false if count of that character in string 1 is < count in string 2
- return true

=end

def scramble(str1, str2)
  str2.chars.each do |char|
    return false if str1.count(char) < str2.count(char)
  end

  true
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaoossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true
