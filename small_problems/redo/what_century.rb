def ordinal(number)
  number = number.to_s

  return number + 'th' if number[-2] == '1'

  case number[-1]
  when '1'
    number + 'st'
  when '2'
    number + 'nd'
  when '3'
    number + 'rd'
  else
    number + 'th'
  end
end

def century(year)
  year % 100 > 0 ? ordinal((year / 100) + 1) : ordinal(year / 100)
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
