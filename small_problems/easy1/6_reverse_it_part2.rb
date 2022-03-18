# Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

# Examples:

#   puts reverse_words('Professional')          # => lanoisseforP
#   puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
#   puts reverse_words('Launch School')         # => hcnuaL loohcS

def reverse_words(string)
  string_arr = string.split
  string_arr.each { |word| word.reverse! if word.length >= 5 }
  string_arr.join(' ')
  # or to make it one line (we can chain method calls even with blocks):
  # string.split.map{ |word| word.length >= 5 ? word.reverse : word }.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

# Lines `9-15` define method `reverse_words`, which takes one parameter.
#
# On line `17`, `reverse_words` is invoked with string argument `Professional`.
# Within the method, this argument is assigned to the local variable `string'.
#
# On line `10`, method `split` is invoked on `string`, and local variable
# `string_arr` is initialized to the array object returned by `split`. On line
# `11`, iterative method `each` is invoked on the array referenced by `string_arr`
# with a `{}` block defined on the same line; the block takes parameter `word`.
#
# On each iteration, an element of `string_arr` is assigned to local variable `word`.
# The method `length` is invoked on `word` and its return value (12) is compared to
# `5` in a conditional statement; the conditional statement is true in this
# case, and `word` invokes the `reverse!` destructive method, which reverses the string
# in place to `lanoisseforP`; this is also the return value of method
# `reverse!`, but that return value is not used.
#
# The if modifier on line `11` is syntactical sugar, replacing a multi-line if
# statement.
#
# On line `12`, method `join` is invoked by array object `string_arr` with
# argument `' '`. This returns a string, and since this is the last statement in
# the method, the string is implicitly returned by `reverse_words`.
#
# On line 17, the return value of `reverse_words` is sent as an argument to
# method `puts` and is output. `puts' has a nil return value, but this value is
# not used.
