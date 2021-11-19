VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
WINNING_MOVES = { rock: ['paper', 'spock'],
                  paper: ['scissors', 'lizard'],
                  scissors: ['rock', 'spock'],
                  spock: ['paper', 'lizard'],
                  lizard: ['rock', 'scissors'] }

def prompt(message)
  puts "=> #{message}"
end

def display_results(choice, computer_choice)
  prompt("You chose: #{choice}. Computer chose: #{computer_choice}.")

  if WINNING_MOVES[choice.to_sym].include?(computer_choice)
    prompt("Computer wins!")
  elsif WINNING_MOVES[computer_choice.to_sym].include?(choice)
    prompt("You win!")
  else
    prompt("It's a tie!")
  end
end

choice = ''

loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That is not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  display_results(choice, computer_choice)

  prompt("Do you want to play again? Y for yes")
  answer = gets.chomp.downcase[0]

  break unless answer == 'y'
end
