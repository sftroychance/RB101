def prompt(message)
  puts "==> #{message}"
end

prompt("Enter the first number")
input_1 = gets.chomp.to_i

prompt("Enter the second number")
input_2 = gets.chomp.to_i

prompt("#{input_1} + #{input_2} = #{input_1 + input_2}")
prompt("#{input_1} - #{input_2} = #{input_1 - input_2}")
prompt("#{input_1} * #{input_2} = #{input_1 * input_2}")
prompt("#{input_1} / #{input_2} = #{input_1 / input_2}")
prompt("#{input_1} % #{input_2} = #{input_1 % input_2}")
prompt("#{input_1} ** #{input_2} = #{input_1 ** input_2}")
