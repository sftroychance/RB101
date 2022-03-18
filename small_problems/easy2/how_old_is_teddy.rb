# Build a program that randomly generates and prints Teddy's age.
# To get the age, you should generate a random number between
# 20 and 200.
#
# Example output:
# Teddy is 69 years old!
#
# Further exploration: Modify this program to ask for a name, and
# then print the age for that person.
# For an extra challenge, use "Teddy" as the name if no name is entered.

def prompt(message)
  puts "=> #{message}"
end

def display_age(name = 'Teddy')
  puts "#{name} is #{rand(20..200)} years old!"
end

prompt('What is your name?')
name = gets.chomp

name.empty? ? display_age : display_age(name)

# Lines `12-14` define method `prompt`, which takes a parameter.
#
# Lines `16-18` define method `display_age`, which takes an optional
# parameter with default value `'Teddy'`.
#
# On line `20`, `prompt` is invoked with the string argument `'What is your
# name?'`. Within the method, on line `12`, local variable `message` is
# initialized to this string object.
#
# On line `13`, method `puts` is invoked with a string the includes the
# interpolated value of `message`. The string `'=> What is your name?'` is output,
# and the method `puts` returns a value of nil; as this is the last statement
# in method `prompt`, the method also returns nil, but this value is not used.
#
# On line `21`, the Kernel method `gets` is invoked, which receives input. The
# return value of `gets`, a string, then invokes method `chomp` to remove the
# newline character from the input string.  Local variable `name` is initialized
# to the string object returned by `chomp`.
#
# On line `23`, in a ternary conditional (syntactical sugar for a multiline
# `if/then` statement), method `empty?` is called on the string object
# referenced by `name`. This method returns a boolean value. If the 'name'
# string is empty, method `display_age` is called without an argument;
# otherwise, `display_age` will be invoked with `name` as an argument. Within
# `display_age`, the local variable is initialized to reference the same
# object as the argument, if one is passed, or it is initialized to a string
# object with the value `'Teddy'`.
#
# On line `17`, the `puts` method is called, passing a string as an argument;
# that string includes two interpolated values--the value of `name` and also a
# random number returned from the method call `rand`, which is invoked with a
# Range argument `(20..200)`. Method `puts` outputs the string, using a string
# representation of the interpolated random number. `puts` returns nil, but this
# value is not used.
