def substrings(str)
  result = []

  (0...str.size).each do |start|
    (start...str.size).each do |stop|
      result << str[start..stop]
    end
  end

  result
end

def palindromes(str)
  candidates = substrings(str)

  candidates.select { |text| text.size > 1 && text == text.reverse }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
   '-madam-', 'madam', 'ada', 'oo'
 ]
p palindromes('knitting cassettes') == [
   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
 ]
