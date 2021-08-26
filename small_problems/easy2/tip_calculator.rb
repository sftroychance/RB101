# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

# Example:
#   What is the bill? 200
#   What is the tip percentage? 15

#   The tip is $30.0
#   The total is $230.0

def prompt(message)
  puts "=> #{message}"
end

def tip_amt(bill, tip_percentage)
  bill * tip_percentage / 100
end

def display_summary(tip, total)
  prompt("The tip is $#{format('%.2f', tip)}")
  prompt("The total is $#{format('%.2f', total)}")
end

prompt('Welcome to the tip calculator!')
prompt('What is the bill?')
bill = gets.chomp.to_f

prompt('What is the tip percentage?')
tip_percentage = gets.chomp.to_f

tip = tip_amt(bill, tip_percentage)
total = bill + tip
display_summary(tip, total)
