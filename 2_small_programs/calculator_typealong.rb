# ask the user for two numbers
# ask the user for the operation to perform
# perform the operation on the given numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

Kernel.puts('Welcome to Calculator!')

Kernel.puts('What is the first number?')
number1 = Kernel.gets().chomp()

Kernel.puts('What is the second number?')
number2 = Kernel.gets().chomp()

Kernel.puts('What operation would you like to perform?')
Kernel.puts('1) add\n2) subtract\n3) multiply\n4) divide')
operator = Kernel.gets().chomp()

if operator == '1'
  result = number1.to_i + number2.to_i
elsif operator == '2'
  result = number1.to_i - number2.to_i
elseif operator == '3'
  result = number1.to_i * number2.to_i
else
  result = number1.to_f / number2.to_f
end

Kernel.puts("The result is #{result}")
