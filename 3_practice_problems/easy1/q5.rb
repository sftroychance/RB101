# Programmatically determine if 42 lies between 10 and 100.

# hint: Use Ruby's range object in your solution.

puts (10..100).include?(42)

# the solution uses (10..100).cover?(42); include? only works if the range is numeric.
