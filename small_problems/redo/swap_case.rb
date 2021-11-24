def swapcase(str)
  str.chars.map do |char|
    char == char.upcase ? char.downcase : char.upcase
  end.join

end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
