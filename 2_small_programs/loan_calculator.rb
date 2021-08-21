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

def prompt(message)
  Kernel.puts("=> #{message}")
end

def calculate_payment(loan_amt, monthly_rate, duration)
  loan_amt * (monthly_rate / (1 - (1 + monthly_rate)**(-duration)))
end

def calculate_monthly_rate(apr)
  apr / 12
end

def valid_number?(number)
  number.match?(/^\d*\.?\d*$/) && number.to_f > 0
end

end_program = false
until end_program

  prompt('Welcome to the Loan Calculator! I''ll gather a few details:')

  loan_amount = ''
  valid_input = false

  until valid_input
    prompt('What is the loan amount?')
    loan_amount =  Kernel.gets().chomp()
    if valid_number?(loan_amount)
      valid_input = true
    else
      prompt('Please enter a valid loan amount.')
    end
  end

  apr = ''
  valid_input = false
  until valid_input
    prompt('What is the APR (in %)?')
    apr = Kernel.gets().chomp()
    if valid_number?(apr)
      valid_input = true
    else
      prompt('Please enter a valid APR.')
    end
  end

  duration = ''
  valid_input = false
  until valid_input
    prompt('What is the duration of the loan (in months)?')
    duration = Kernel.gets().chomp()
    if valid_number?(duration)
      valid_input = true
    else
      prompt('Please enter a valid loan duration.')
    end
  end
  monthly_rate = calculate_monthly_rate(apr.to_f)

  payment = calculate_payment(loan_amount.to_f, monthly_rate.to_f / 100, duration.to_i)

  prompt("For a loan of $#{Kernel.sprintf("%.2f", loan_amount)} for #{duration} months at #{apr}% " \
         "APR, the monthly payment is: $#{Kernel.sprintf("%.2f", payment)}")

end_program = true

end
