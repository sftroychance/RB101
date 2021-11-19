def palindromic_number?(number)
  number.to_s == number.to_s.reverse
end

p palindromic_number?(0)
p palindromic_number?(121)
p palindromic_number?(123321)
