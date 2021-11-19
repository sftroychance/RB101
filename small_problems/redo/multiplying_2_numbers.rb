def multiply(num1, num2)
  num1 * num2
end

def square(num)
  num * num
end


puts multiply(10, 5)
puts multiply('three', 5)
puts multiply(0, 3)

puts square(0)
puts square(2)
puts square('hi') # TypeError
