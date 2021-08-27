# Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself)

# Example:

# square(5) == 25
# square(-8) == 64

# Further Exploration

# What if we wanted to generalize this method to a "power to the n" type method: cubed, to the 4th power, to the 5th, etc. How would we go about doing so while still using the multiply method?

def multiply(num1, num2)
  num1 * num2
end

def square(number)
  multiply(number, number)
end

def power_up(number, exponent)
  total = 1
  exponent.times { total = multiply(total, number) }

  total
end

p square(5)
p square(-5)
p square(0)
p square(10)

p power_up(2, 3)
p power_up(5, 4)
p power_up(5, 0)
p power_up(5, 1)
