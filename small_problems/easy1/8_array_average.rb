# Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

# Examples:

# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

# The tests above should print true.

def average(numbers)
  numbers.sum / numbers.size
end 

def average_float(numbers)
  numbers.sum.to_f / numbers.size
end 

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

puts average_float([1, 6])
puts average_float([1, 5, 87, 45, 8, 8])
puts average_float([9, 47, 23, 95, 16, 52])
