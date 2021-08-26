# Build a program that randomly generates and prints Teddy's age.
# To get the age, you should generate a random number between
# 20 and 200.
#
# Example output:
# Teddy is 69 years old!
#
# Further exploration: Modify this program to ask for a name, and
# then print the age for that person.
# For an extra challenge, use "Teddy" as the name if no name is entered.

def prompt(message)
  puts "=> #{message}"
end

def display_age(name = 'Teddy')
  puts "#{name} is #{rand(20..200)} years old!"
end

prompt('What is your name?')
name = gets.chomp

name.empty? ? display_age : display_age(name)
