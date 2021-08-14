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
