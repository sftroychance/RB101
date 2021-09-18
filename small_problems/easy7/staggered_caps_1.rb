# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.
#
# Example:
#
# staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# staggered_case('ALL_CAPS') == 'AlL_CaPs'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
=begin
P:
summary: a method that takes a string and returns a new string with alternating uppercase and lowercase letters
input: a string
output: a new string

implicit rules: the first character is capitalized
explicit rules: ignore non-alpha characters but include them in the alternation

questions:

E:

D:
array

A:
1. write a method that takes a string parameter
2. downcase the string
3. split the string into a character array
4. iterate over the character array.
   a. capitalize the first letter of the array, then alternate capitalization with each remaining iteration
5. join the characters into a new string
6. return the new string

- modification for further exploration:
  write the method to take another argument indicating if the first character should be lowercase
=end

def staggered_case(string)
  string.downcase.chars.each_with_index do |char, idx|
    char.upcase! if idx.even?
  end.join
end

def staggered_case_2(string, first_char_uppercase: true)
  string.downcase.chars.each_with_index do |char, idx|
    char.upcase! if first_char_uppercase && idx.even? || !first_char_uppercase && idx.odd?
  end.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

p staggered_case_2('I Love Launch School!', first_char_uppercase: false) == 'i lOvE LaUnCh sChOoL!'
p staggered_case_2('ALL_CAPS', first_char_uppercase: false) == 'aLl_cApS'
p staggered_case_2('ignore 77 the 444 numbers', first_char_uppercase: false) == 'iGnOrE 77 tHe 444 nUmBeRs'
