# ask the user for two numbers
# ask the user for the operation to perform
# perform the operation on the given numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)
#
# Things to think about:
#
# 1. A better way to validate that the user has input a number would be to match it using a regex (/\d+/)
# 2. String#to_i and String#to_f will return a 0 (or 0.0) if there is no number found in the string, or if the first character in the string is not a number.
# 3. for the operation_to_message method, if we need to put code after the case statement, we could assign the result of the case statement to a variable and return that variable.
# 5. Kernel is a module that is included in class Object, so its methods are available in every Ruby object; as long as we do not create a method with the same name as the Kernel method we want to use, we can call it without specifying the caller.
# 6. Regarding messages in the program, moving them to a configuration file: Perhaps it is possible to create a module that holds those messages. Upon further reading, it seems that YAML is a common option for external configuration settings--the messages would be put into yaml format in an external file; the program would need to "require 'yaml'", then a hash of messages loaded into the program with YAML.load.

require 'pry-byebug'

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt('Welcome to Calculator! Enter your name:')
name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}")

loop do # main loop
  number1 = ''
  loop do
    prompt('What is the first number?')
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt("Hmmm...that doesn't look like a valid number")
    end
  end

  number2 = ''
  loop do
    prompt('What is the second number?')
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt("Hmmm...that doesn't look like a valid number")
    end
  end

  operator_prompt = <<-MSG
    What action would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)
  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")
  sleep 1
  binding.pry
  case operator
  when '1'
    result = number1.to_i + number2.to_i
  when '2'
    result = number1.to_i - number2.to_i
  when '3'
    result = number1.to_i * number2.to_i
  when '4'
    result = number1.to_f / number2.to_f
  end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y if yes)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using calculator! Goodbye!")
