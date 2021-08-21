# Mortgage/Car Loan Calculator
# Calculate monthly payment.
# User input: loan amount, APR, loan duration
# Output: monthly payment
# Problem domain:
# - calculation for monthly payment: m = p * (j / (1 - (1 + j)**(-n)))
#   m = monthly payment
#   p = loan amount
#   j = monthly interest rate
#   n = loan duration in months
#
# - APR to montly interest rate: APR / 12
#
# Algorithm:
# - User input for loan amount, APR, and loan duration
#   - validate numeric and > 0 for all three
# - Calculate monthly interest rate
# - Calculate monthly payment
# - Return summary to user

require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def calculate_payment(loan)
  monthly_rate = loan[:apr] / 1200 # converts annual to monthly and % to decimal
  loan[:loan_amt] * (monthly_rate / (1 - (1 + monthly_rate)**(-loan[:months])))
end

def valid_number?(number)
  number.match?(/^\d*\.?\d*$/) && number.to_f > 0
end

def input(value_type, loan)
  input = ''
  valid = false
  prompt(MESSAGES[value_type.to_sym])
  until valid
    input = Kernel.gets().chomp()
    if valid_number?(input)
      valid = true
    else
      prompt(MESSAGES[(value_type + '_err').to_sym])
    end
  end
  loan[value_type.to_sym] = input.to_f
end

prompt(MESSAGES[:welcome])
end_program = false

until end_program

  loan = { loan_amt: 0, apr: 0, months: 0 }

  input('loan_amt', loan)
  input('apr', loan)
  input('months', loan)

  payment = calculate_payment(loan)

  prompt("For a loan of $#{Kernel.sprintf('%.2f', loan[:loan_amt])} " \
         "for #{loan[:months].to_i} months at #{loan[:apr]}% APR, " \
         "the monthly payment is: $#{Kernel.sprintf('%.2f', payment)}")

  prompt(MESSAGES[:continue])
  continue = Kernel.gets().chomp()
  end_program = true unless continue.downcase().start_with?('y')

end
