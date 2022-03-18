# Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

# Examples:

# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''

# The tests above should print true.

def reverse_sentence(string)
  string.split.reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

# Lines `12-14` denote a definition for method `reverse_sentence`, which takes
# one parameter.
#
# On line `16`, `reverse_sentence` is invoked with the string argument `Hello
# World`. Within the method, this argument is assigned to local variable
# `string`.
#
# On line `13`, the string object referenced by `string` invokes the
# `String#split` method, which returns an array of strings. The resulting array,
# in turn, calls the `reverse` method, which reverses the order of the elements
# of that array. The array object returned by `reverse` invokes the `join` method with
# argument `' '`, which returns a string. This value is implicity returned by
# the `reverse_sentence` method.
#
# On line `16`, the return value of `reverse_sentence` is sent as an argument to
# method `puts` and is output; `puts` returns nil, but this value is not used.
