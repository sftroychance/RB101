# Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

(1..99).each { |num| puts num if num.odd? }

puts (1..99).select(&:odd?)
