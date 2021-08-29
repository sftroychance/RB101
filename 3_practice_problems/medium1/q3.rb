# Alan wrote the following method, which was intended to show all of the factors of the input number:
#
# def factors(number)
#   divisor = number
#   factors = []
#   begin
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end until divisor == 0
#   factors
# end
#
# Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. How can you make this work without using begin/end/until? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.
#
# fixed below by iterating from the number down to 1 and checking for factors; this will return an empty array for 0 and negative numbers.
#
# Bonus 1
#
# What is the purpose of the number % divisor == 0 ?
# This is to determine if the divisor is a factor of number; if a number has no remainder with a particular divisor, that divisor is a factor.
#
# Bonus 2
#
# What is the purpose of the second-to-last line (line 8) in the method (the factors before the method's end)?
# Since the last expression in the method is the loop (which will not return the array--in this case it will return the number, since that is the integer calling the #downto method), we need to explitly return the array containing the set of factors. The last expression evaulated in the method is its return value.
#
#
def factors(number)
  factors = []

  number.downto(1) do |div|
    factors << number / div if number % div == 0
  end

  factors
end

p factors(25)
p factors(100)
p factors(0)
p factors(-10)
