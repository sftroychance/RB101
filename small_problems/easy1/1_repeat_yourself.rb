# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# Example:

#   repeat('Hello', 3)

# Output:

#   Hello
#   Hello
#   Hello

def repeat(string, repetitions)
  repetitions.times { puts string }
end

repeat('Hello', 3)
repeat('Hi there', 8)

# edge cases
repeat('howdy', 0)
repeat('', 5)
repeat(3, 5)
