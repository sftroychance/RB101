# Write a method that counts the number of occurrences of each element in a given array.

#   vehicles = [
#     'car', 'car', 'truck', 'car', 'SUV', 'truck',
#     'motorcycle', 'motorcycle', 'car', 'truck'
#   ]

# count_occurrences(vehicles)

# The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each element alongside the number of occurrences.

# Expected output:

#   car => 4
#   truck => 3
#   SUV => 1
#   motorcycle => 2
#
# algo:
#  - create empty hash
#  - iterate over array, creating a hash key and initial count for each entry
#     - if there is already an entry for that hash key, increment the count
#  - iterate over hash, printing each key with its count value

def count_occurrences(list)
  list_hash = {}

  list.each do |value|
    list_hash[value] ? list_hash[value] += 1 : list_hash[value] = 1
  end

  list_hash.each { |key, value| puts "#{key} => #{value}" }
  p list
end

# further exploration: words are case insensitive
# also uses solution's method for populating the hash
def count_occurrences_ignorecase(list)
  list_hash = {}

  list.each do |value|
    value.downcase!
    list_hash[value] ? list_hash[value] += 1 : list_hash[value] = 1
  end

  list_hash.each { |key, value| puts "#{key} => #{value}" }
end

# added some values to the given vehicles array to test case insensitivity
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv', 'Car'
]

count_occurrences(vehicles)
puts 'ignoring case:'
count_occurrences_ignorecase(vehicles)

# Lines `25-33` denote a definition for method `count_occurrences`, with one
# parameter and lines `37-46` define method `count_occurrences_ignorecase`, also
# with one parameter.
#
# On line `49`, local variable `vehicles` is assigned to an array of strings.
#
# On line `54`, the `count_occurrences` method is invoked with `vehicles` as an
# argument. Within the method, local variable `list` is initialized to reference
# the same object as `vehicles`.
#
# On line `26`, local variable `list_hash` is initialized to an empty hash
# object.
#
# On line `28`, method `#each` is invoked on the `list` array object with a
# `do...end` block defined on lines `28-30` receiving one block parameter.  With
# each iteration, one value of the `list` array is passed to the block, assigned
# to local variable `value`. On line `29` in a ternary conditional statement,
# the `list_hash` hash is assessed for the presence of a value at the key
# indicated by `value`. If the key/value pair does not exist, it is initialized
# to a value of `1`; if it does exist, its value is incremented by `1`.
#
# On line `32` the `list_hash` hash object invokes `#each`, with a
# block defined in `{}` on the same line, and each key/value pair in the hash
# is passed to the block, where the key/value pair is output. The `#each` method
# returns the object referenced by `list_hash`, which value is also implicitly
# returned by the method `count_occurrences`, but this return value is not used.
#
# On line `56` the `puts` method is called with string argument `ignoring
# case:`, and this string is output. The `puts` method returns nil, but this
# value is not used.
#
# On line `57`, method `count_occurrences_ignorecase` is called with the
# argument `vehicles`. Within the method, at line `38`, local variable `list`
# is initialized to reference the same array object as `vehicles`.
#
# On line `40` the method `#each` is invoked on the array object referenced by
# `list`, with a `do..end` block defined on lines `40-43`, with one block
# parameter. For each iteration of the block, a value in the `list`
# array is passed to the block, assigned to the local variable `value`. On line
# `41`. method `String#downcase!` is called on the object referenced by `value`;
# this method is destructive and thus mutates the string value within the object
# referenced by `list` and also by `vehicles`.
#
# On line `42`, a condition tests for the existence of a value for the key
# denoted by `value` in the `list_hash` hash object; if a value is present, it
# is incremented by 1; if not, it is assigned a value of `1`.
#
# After `list_hash` is populated by the `#each` method, on line `45`, the
# `#each` method is called on the list_hash object, iterating over the hash to
# output its key/value pairs.
#
# This code illustrates the mutability of objects passed to methods.
