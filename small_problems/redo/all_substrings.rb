def substrings(str)
  result = []

  (0...str.size).each do |start|
    (start...str.size).each do |stop|
      result << str[start..stop]
    end
  end

  p result
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
