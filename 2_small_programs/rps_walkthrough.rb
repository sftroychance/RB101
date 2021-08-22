# reflecting on 'things to consider'
# 1. If you move the display_results method definition above the prompt method definition, this will make no difference; methods can be defined in any order.
# 2. if you invoke a method right after a method definition but that method calls another method that is defined after the initial method invocation, this will return an 'undefined method' error.
# 3. If the display_results method were to return a string instead of printing the string directly, first we should change the name of the method to 'results' since display would be misleading, and you would use the method by assigning the string it returns to a variable and then printing it, or putting the method invocation inside a print statement (or, here, a 'prompt' method call).
# 4. The code here has been refactored to resolve the rubocop complaint about complexity of display_results; the WINNER hash simplifies the series of || statements to determine winner.ß

VALID_RESPONSES = ['rock', 'paper', 'scissors']
WINNER = { rock: 'paper', paper: 'scissors', scissors: 'rock' }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_results(player, computer)
  prompt("You chose #{player}. The computer chose #{computer}")

  if player == computer
    prompt("It's a tie!")
  elsif WINNER[player.to_sym] == computer
    prompt('Computer wins!')
  else
    prompt('You win!')
  end
end

system('clear')
prompt('Welcome to Rock | Paper | Scissors!')
program_end = false

until program_end

  valid = false
  until valid
    prompt("Choose one: #{VALID_RESPONSES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_RESPONSES.include?(choice)
      valid = true
    else
      prompt('That is not a valid choice.')
    end
  end

  computer_choice = VALID_RESPONSES.sample

  display_results(choice, computer_choice)

  prompt("Do you want to play again? 'Y' for yes?")
  continue = Kernel.gets().chomp()
  program_end = true unless continue.start_with?('y')
  system('clear')

end
