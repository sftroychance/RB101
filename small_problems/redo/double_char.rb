def repeater(str)
  str.gsub(/(.)/, '\1\1')
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
