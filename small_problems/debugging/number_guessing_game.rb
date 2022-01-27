# The problem with the original code is that it is attempting
# a recursive call to guess_number when the user makes an
# incorrect guess. The problem is that every time that call
# is made, attempts is reset to 0, so the max_attempts value
# is never reached, resulting in an infinite loop.
#
# As there does not seem to be a good reason to make this
# call recursive, we can set a valid_selection flag and
# loop based on that value, initializing it to false and
# setting it to true when the correct guess is made, ending the
# loop.
#
# Alternatively, as in the official solution, we can just
# call break to exit the loop when the correct selection
# is made, avoiding the use of the valid_selection flag.

def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  valid_selection = false

  # loop do
  until valid_selection
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      valid_selection = true
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number

      # Try again:
      # guess_number(max_number, max_attempts)
    end
  end
end

guess_number(10, 3)
