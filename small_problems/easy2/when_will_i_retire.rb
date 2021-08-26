# Build a program that displays when the user will retire and how many years she has to work till retirement.

# Example:

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!
require 'date'

def prompt(message)
  puts "=> #{message}"
end

prompt('Welcome to the retirement calculator!')
prompt('What is your age?')
age = gets.chomp.to_i

prompt('At what age would you like to retire?')
retirement_age = gets.chomp.to_i

this_year = Date.today.year
years_to_retirement = retirement_age - age
retirement_year = this_year + years_to_retirement

prompt("It's #{this_year}. You will retire in #{retirement_year}.")
prompt("You have only #{years_to_retirement} years of work to go!")
