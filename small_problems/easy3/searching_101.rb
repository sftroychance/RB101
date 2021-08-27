# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

# example:

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].
#
# Assumption: The number is an integer, can be negative or positive

def prompt(message)
  puts "==> #{message}"
end

def ordinal(number)
  number = number.to_s

  return number + 'th' if number[-2] == '1'

  case number[-1]
  when '1'
    number + 'st'
  when '2'
    number + 'nd'
  when '3'
    number + 'rd'
  else
    number + 'th'
  end
end

def valid?(input)
  input.to_i.to_s == input
end

num_array = []

(1..5).each do |num|
  prompt("Enter the #{ordinal(num)} number:")
  number = gets.chomp

  until valid?(number)
    prompt('Please enter a valid number.')
    number = gets.chomp
  end

  num_array << number.to_i
end

prompt('Enter the last number:')
final_num = gets.chomp

until valid?(final_num)
  prompt('Please enter a valid number.')
  final_num = gets.chomp
end

if num_array.include?(final_num.to_i)
  puts "The number #{final_num} appears in #{num_array}."
else
  puts "The number #{final_num} does not appear in #{num_array}."
end
