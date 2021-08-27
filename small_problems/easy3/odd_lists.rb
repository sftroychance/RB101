# Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

# Examples:

# oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# oddities(['abc', 'def']) == ['abc']
# oddities([123]) == [123]
# oddities([]) == []

# Further Exploration:
# Write a companion method that returns the 2nd, 4th, 6th, and so on elements of an array.
# Try to solve this exercise in at least 2 additional ways.

def oddities(array)
  array.select.with_index { |_, idx| idx.even? }
end

def evenities(array)
  array.select.with_index { |_, idx| idx.odd? }
end

def oddities_alt(array)
  array2 = []
  array.each_with_index do |value, idx|
    array2 << value if idx.even?
  end
  array2
end

def oddities_alt2!(array)
  ctr = array.size - 1
  until ctr < 0
    array.delete_at(ctr) if ctr.odd?
    ctr -= 1
  end
  array
end

puts "oddities:"
p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 3, 2, 1]) == [1, 3, 2]

puts "evenities:"
p evenities([2, 3, 4, 5, 6]) == [3, 5]
p evenities([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p evenities(['abc', 'def']) == ['def']
p evenities([123]) == []
p evenities([]) == []
p evenities([1, 2, 3, 3, 2, 1]) == [2, 3, 1]

puts "oddities_alt:"
p oddities_alt([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities_alt([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities_alt(['abc', 'def']) == ['abc']
p oddities_alt([123]) == [123]
p oddities_alt([]) == []
p oddities_alt([1, 2, 3, 3, 2, 1]) == [1, 3, 2]

puts "oddities_alt2!:"
p oddities_alt2!([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities_alt2!([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities_alt2!(['abc', 'def']) == ['abc']
p oddities_alt2!([123]) == [123]
p oddities_alt2!([]) == []
p oddities_alt2!([1, 2, 3, 3, 2, 1]) == [1, 3, 2]
