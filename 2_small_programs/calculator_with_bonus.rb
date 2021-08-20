# adding bonus functionality to calculator app:
# 1. Better way to validate integer input, including 0.
# 2. Validate number to include integers and floats.
# 3. Revise operation_to_message so case statement is not the last expression.
# 4. Extract all messages to a configuration file.
# 5. Internationalize the messages.
# notes:
#   - Language is hard-coded but could present an option to the user
#   - Only English (:en) and Spanish (:es) are current options
#   - The Spanish is rough (Google) translation

require_relative 'messages'

LANG = :es

def prompt(action, value='')
    Kernel.puts("=>#{MESSAGE[action][LANG]} #{value}")
end

def valid_number?(num)
  num.match?(/^-?\d+\.?\d*$/) # accepts integer, float, and negative numbers
end

def operation_to_message(op)
  return MESSAGE[:operation][LANG][op.to_i - 1] + ' ' + MESSAGE[:oper_pred][LANG]
end

prompt(:welcome)
name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(:name_err)
  else
    break
  end
end

prompt(:greet, name)

loop do # main loop
  number1 = ''
  loop do
    prompt(:first_num)
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(:num_error)
    end
  end

  number2 = ''
  loop do
    prompt(:second_num)
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(:num_error)
    end
  end
  prompt(:which_action)
  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(:action_error)
    end
  end

  # prompt(:operation, idx=(operator.to_i - 1))
  puts operation_to_message(operator)
  print ' .'
  sleep 1
  print ' .'
  sleep 1
  print "\n"
  case operator
  when '1'
    result = number1.to_f + number2.to_f
  when '2'
    result = number1.to_f - number2.to_f
  when '3'
    result = number1.to_f * number2.to_f
  when '4'
    result = number1.to_f / number2.to_f
  end

  prompt(:result, result)

  prompt(:continue)
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(:goodbye)
