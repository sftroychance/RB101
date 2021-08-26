# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

valid = false
until valid
  puts 'Enter an integer greater than 0'
  number = gets.chomp

  if number.match?(/^\d+$/) && number.to_i > 0
    number = number.to_i
    valid = true
  else
    puts 'That is not a valid integer.'
  end
end

valid = false
until valid
  puts "Enter 's' to calculate the sum of all integers between 1 and #{number}"
  puts "Enter 'p' to calculate the product of all integers between 1 and #{number}"
  choice = gets.chomp

  if ['s', 'p'].include?(choice)
    valid = true
  else
    puts 'That is not a valid choice.'
  end
end

case choice
when 's'
  puts "The sum of all digits between 1 and #{number} is #{(1..number).reduce(&:+)}"
when 'p'
  puts "The product of all digits between 1 and #{number} is #{(1..number).reduce(&:*)}"
end
