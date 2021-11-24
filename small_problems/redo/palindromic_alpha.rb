def substrings(str)
  str.gsub!(/[^a-zA-Z0-9]/, '').downcase!
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

p palindromes("ma'dam")
p palindromes("Ma'dam")
