# Print all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

puts (1..99).select(&:even?)

1.upto(99).each { |num| puts num if num.even? }
