# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

# Examples:

# running_total([2, 5, 13]) == [2, 7, 20]
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# running_total([3]) == [3]
# running_total([]) == []

def running_total(arr)
  total = 0
  arr.map { |num| total += num }
end

def running_total_alt(arr)
  arr.map.with_index { |_, idx| arr[0..idx].reduce(&:+) }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

p running_total_alt([2, 5, 13]) == [2, 7, 20]
p running_total_alt([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total_alt([3]) == [3]
p running_total_alt([]) == []
