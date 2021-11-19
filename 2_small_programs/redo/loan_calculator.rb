=begin
P:
summary: build a car/mortgage loan calculator
input: loan amount, APR, duration
output: summary info with calculated monthly payment

explicit rules: formula to calculate payment: m = p * (j / (1 - (1 + j)**(-n)))
implicit rules: use YAML to handle messages

questions:

E: handle 0 value inputs

D: hash to handle yml messages

A:
- get input for loan amount, APR, and loan duration
- convert APR to monthly rate -> APR / 12.0
- calculate monthly payment using given formula
- display results with appropriate formatting for $

=end

require 'yaml'
MESSAGES = YAML.load_file('loan_calc_messages.yml')

def prompt(string)
  puts "==> #{string}"
end

def monthly_rate(apr)
  apr / 12.0
end

def monthly_payment(loan_amt, interest_rate, duration)
  loan_amt * (interest_rate / (1 - (1 + interest_rate)**(-duration)))
end

def valid?(number)
  number.match?(/^\d*\.?\d*$/) && number.to_f > 0
end

prompt(MESSAGES['welcome'])

continue = true

while continue
  valid_input = false

  until valid_input
    prompt(MESSAGES['loan_amt'])
    loan_amt = gets.chomp
    if valid?(loan_amt)
      valid_input = true
      loan_amt = loan_amt.to_f
    else
      prompt(MESSAGES['loan_amt_err'])
    end
  end

  valid_input = false

  until valid_input
    prompt(MESSAGES['apr'])
    apr = gets.chomp
    if valid?(apr)
      valid_input = true
      apr = apr.to_f / 100
    else
      prompt(MESSAGES['apr_err'])
    end
  end

  valid_input = false

  until valid_input
    prompt(MESSAGES['duration'])
    duration = gets.chomp
    if valid?(duration)
      valid_input = true
      duration = duration.to_i
    else
      prompt(MESSAGES['duration_err'])
    end
  end

  interest_rate = monthly_rate(apr)

  payment = monthly_payment(loan_amt, interest_rate, duration)

  loan_amt = format("%.2f", loan_amt)
  payment = format("%.2f", payment)

  puts "For a loan of $#{loan_amt} @ #{apr * 100}% APR for a duration of #{duration} months, " \
       "the monthly payment is $#{payment}."

  puts "\nWould you like to make another calculation? 'y' for yes"
  response = gets.chomp
  if response.downcase != 'y'
    continue = false
  end
end
