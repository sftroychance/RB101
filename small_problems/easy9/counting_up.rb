# Write a method that takes an integer argument, and returns an Array of all
# integers, in sequence, between 1 and the argument.
#
# You may assume that the argument will always be a valid integer that is greater than 0.

def sequence(number)
  arr = []

  if number > 0
    1.upto(number) do |num|
      arr << num
    end
  else
    number.upto(-1) do |num|
      arr << num
      arr.sort.reverse!
    end
  end

  arr
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-1)
p sequence(-5)

# more concise: (1..number).to_a
