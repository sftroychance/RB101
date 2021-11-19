
def ordinal(number)
  number = number.to_s

  return number + 'th' if number[-2] == '1'

  case number[-1]
  when '1'
    number + 'st'
  when '2'
    number + 'nd'
  when '3'
    number + 'rd'
  else
    number + 'th'
  end
end

def prompt(message)
  puts "==> #{message}"
end

input = []

1.upto(5) do |x|
  prompt "Enter the #{ordinal(x)} number:"
  input << gets.chomp.to_i
end

prompt "Enter the last number:"
search_item = gets.chomp.to_i

if input.include?(search_item)
  prompt "The number #{search_item} appears in #{p input}"
else
  prompt "The number #{search_item} does not appear in #{p input}"
end
