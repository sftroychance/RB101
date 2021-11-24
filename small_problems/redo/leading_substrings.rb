def leading_substrings(str)
  result = []

  (0...str.size).each do |idx|
    result << str[0..idx]
  end

  result
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
