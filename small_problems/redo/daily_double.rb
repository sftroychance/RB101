def crunch(str)
  prev = ''
  new_str = ''

  arr = str.split('')

  arr.each_with_index do |char, idx|
    if char != prev
      new_str << char
      prev = char
    end
  end

  new_str
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
