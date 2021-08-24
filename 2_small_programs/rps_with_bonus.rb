RESPONSES = { r: 'rock', p: 'paper', s: 'scissors', sp: 'Spock', l: 'lizard' }
WINNER = { rock: ['paper', 'Spock'],
           paper: ['scissors', 'lizard'],
           scissors: ['rock', 'Spock'],
           Spock: ['lizard', 'paper'],
           lizard: ['rock', 'scissors'] }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def results(player, computer)
  if player == computer
    "It's a tie!"
  elsif WINNER[RESPONSES[player].to_sym].include?(RESPONSES[computer])
    'Computer wins!'
  else
    'You win!'
  end
end

def display_results(player, computer, result)
  prompt("You chose #{RESPONSES[player]}. The computer chose #{RESPONSES[computer]}.")
  prompt(result)
end

system('clear')
prompt('Welcome to Rock | Paper | Scissors | Spock | Lizard!')
prompt('Can you get to three wins before the computer?')

program_end = false

until program_end

  player_wins = 0
  computer_wins = 0

  loop do
    valid = false
    until valid
      prompt("Choose one:")
      RESPONSES.each { |abbr, response| puts "\t#{abbr} => #{response}" }
      choice = Kernel.gets().chomp().to_sym

      if RESPONSES.keys.include?(choice)
        valid = true
      else
        system('clear')
        prompt("#{choice} is not a valid choice.")
      end
    end

    computer_choice = RESPONSES.keys.sample

    outcome = results(choice, computer_choice)

    display_results(choice, computer_choice, outcome)

    if outcome == 'Computer wins!'
      computer_wins += 1
    elsif outcome == 'You win!'
      player_wins += 1
    end

    sleep 2
    system('clear')

    if player_wins >= 3
      prompt('You win the grand round! First to three wins!')
      break
    elsif computer_wins >= 3
      prompt('The computer wins the grand round! First to three wins!')
      break
    end
  end

  prompt("Do you want to play again? 'Y' for yes?")
  continue = Kernel.gets().chomp()
  program_end = true unless continue.downcase.start_with?('y')
  system('clear')

end
