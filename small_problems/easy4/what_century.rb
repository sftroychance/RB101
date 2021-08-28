# Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

# Examples:

# century(2000) == '20th'
# century(2001) == '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# century(5) == '1st'
# century(10103) == '102nd'
# century(1052) == '11th'
# century(1127) == '12th'
# century(11201) == '113th'

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
  cent = year / 100
  cent += 1 if year % 100 > 0
  ordinal(cent)
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
