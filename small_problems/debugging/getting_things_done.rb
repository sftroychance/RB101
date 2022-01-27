# The move method here is written as a recursive method, but it has
# no exit case, so it will not stop calling itself, until you get a
# SystemStackError. There is no obvious reason for this method to be
# recursive, so we can simply iterate n times. If there is some reason
# we want to keep it recursive, we could have it return when n == 0.

def move(n, from_array, to_array)
  # return if n == 0
  # to_array << from_array.shift
  # move(n - 1, from_array, to_array)

  n.times { to_array << from_array.shift }
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']
