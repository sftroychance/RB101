def xor?(exp1, exp2)
  (exp1 && !exp2) || (!exp1 && exp2)
end

puts xor?(5.even?, 4.even?)
puts xor?(5.odd?, 4.even?)
