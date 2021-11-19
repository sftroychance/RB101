def palindrome?(str)
  str.downcase!
  str.gsub!(/[^A-Za-z]/, '')

  str == str.reverse
end

p palindrome?('madam')
p palindrome?('Madam')
p palindrome?("Madam, I'm Adam")
