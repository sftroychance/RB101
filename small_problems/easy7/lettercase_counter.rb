# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.
#
# Examples
#
# letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
#
=begin
P:
summary: a method that receives a string and counts lowercase, uppercase, and non-alpha characters
input: a string
output: a hash with the counts of the types of characters

implicit rules:
explicit rules:

questions:

E:

D:
string array, hash

A:
1. write a method that takes a string parameter
2. initialize a hash to contain counts
3. split the string array into characters
4. iterate over the character array and increment the appropriate counter
5. return the hash

=end

def letter_case_count(string)
  output_hash = { lowercase: 0, uppercase: 0, neither: 0 }

  string.each_char do |char|
    case char
    when ('A'..'Z')
      output_hash[:uppercase] += 1
    when ('a'..'z')
      output_hash[:lowercase] += 1
    else
      output_hash[:neither] += 1
    end
  end

  output_hash
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
