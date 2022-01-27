# In the original code (commented out), decrease was being called
# with the argument counter, but a number cannot be mutated by
# a method, so we need to capture the return value from the
# decrease method by assigning it to counter
#
COUNTDOWN_START = 10

def decrease(counter)
  # counter -= 1  refactoring note: can remove the = here
  counter - 1
end

counter = COUNTDOWN_START

COUNTDOWN_START.times do
  puts counter
  # decrease(counter)
  counter = decrease(counter)
end

puts 'LAUNCH!'
