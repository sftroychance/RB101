# Write a method that takes a string, and returns a new string in which every character is doubled.

def repeater(string)
  str1 = str2 = string.chars

  str1.zip(str2).join # or just string.chars.zip(string.chars).join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
