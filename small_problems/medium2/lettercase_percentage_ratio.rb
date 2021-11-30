=begin
P:
summary: calculate the percentage of characters in a string that are lowercase, uppercase,
or neither
input: a string
output: a hash with keys representing each character type, values representing percentage
of that character type in the string

implicit rules: spaces are included and counted as 'neither'
explicit rules: the given string will contain a least one character

questions:

E:
letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

D:
hash to contain results
arrays for intermediate counting of character types

A:
- count total number of characters in the string
- count lowercase characters and uppercase characters (using regex with scan)
- subtract lowercase and uppercase from total characters
- calculate percentages for each character type
- populate hash with results

=end

def letter_percentages(str)
  results = {}

  results[:lowercase] = (str.scan(/[a-z]/).count / str.size.to_f * 100).round(1)
  results[:uppercase] = (str.scan(/[A-Z]/).count / str.size.to_f * 100).round(1)
  results[:neither] = 100 - results[:lowercase] - results[:uppercase]

  results
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
