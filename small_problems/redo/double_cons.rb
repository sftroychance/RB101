def repeater(str)
  str.chars.map { |char| char =~ /[aeiou ]/ ? char : char * 2 }.join
end

p repeater('Hello') == "HHellllo"
p repeater("Good job!") == "GGoodd jjobb!!"
p repeater('') == ''
