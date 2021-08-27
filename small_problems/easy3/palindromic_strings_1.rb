# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

#   Examples:

#   palindrome?('madam') == true
#   palindrome?('Madam') == false          # (case matters)
#   palindrome?("madam i'm adam") == false # (all characters matter)
#   palindrome?('356653') == true
# Further Exploration
# Write a method that determines whether an array is palindromic; that is, the element values appear in the same sequence both forwards and backwards in the array. Now write a method that determines whether an array or a string is palindromic; that is, write a method that can take either an array or a string argument, and determines whether that argument is a palindrome. You may not use an if, unless, or case statement or modifier.
#
# The reverse method will work for both a string and array, so new methods do not need to be written to perform these functions.

def palindrome?(obj)
  obj == obj.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

p palindrome?([1, 2, 3, 2, 1]) == true
p palindrome?([1, 2, 3, 4, 2, 1]) == false
