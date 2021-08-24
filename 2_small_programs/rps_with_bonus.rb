RESPONSES = { r: 'rock', p: 'paper', s: 'scissors', sp: 'Spock', l: 'lizard' }
WINNING_MOVES = { rock: ['paper', 'Spock'],
                  paper: ['scissors', 'lizard'],
                  scissors: ['rock', 'Spock'],
                  Spock: ['lizard', 'paper'],
                  lizard: ['rock', 'scissors'] }
WINS_PER_ROUND = 3

def prompt(message)
  puts "=> #{message}"
end

def get_player_choice
  loop do
    prompt("Choose one:")
    RESPONSES.each { |abbr, response| puts "\t#{abbr} => #{response}" }
    player_choice = gets.chomp.to_sym

    if RESPONSES.keys.include?(player_choice)
      return player_choice
    else
      system('clear')
      prompt("#{player_choice} is not a valid choice.")
    end
  end
end

def results(player, computer, scores)
  if player == computer
    "It's a tie!"
  elsif WINNING_MOVES[RESPONSES[player].to_sym].include?(RESPONSES[computer])
    scores[:computer] += 1
    'Computer wins!'
  else
    scores[:player] += 1
    'You win!'
  end
end

def display_results(player, computer, outcome, scores)
  prompt("You chose #{RESPONSES[player]}. The computer chose #{RESPONSES[computer]}.")
  prompt(outcome)
  puts "\n"
  prompt("Total Score => You: #{scores[:player]}  Computer: #{scores[:computer]}")
end

def display_grand_winner(scores)
  if scores[:player] >= WINS_PER_ROUND
    prompt("You win the grand round! First to #{WINS_PER_ROUND} wins!")
  elsif scores[:computer] >= WINS_PER_ROUND
    prompt("The computer wins the grand round! First to #{WINS_PER_ROUND} wins!")
  end
end

def play_again?
  loop do
    prompt("Do you want to play again? Y/N")
    continue = gets.chomp
    if continue.downcase == 'y'
      return true
    elsif continue.downcase == 'n'
      return false
    else
      prompt('That is not a valid choice! Y/N')
    end
  end
end

system('clear')
prompt('Welcome to Rock | Paper | Scissors | Spock | Lizard!')
prompt("Can you get to #{WINS_PER_ROUND} wins before the computer?")

program_end = false

until program_end

  scores = { player: 0, computer: 0 }

  loop do
    player_choice = get_player_choice()

    computer_choice = RESPONSES.keys.sample

    outcome = results(player_choice, computer_choice, scores)

    display_results(player_choice, computer_choice, outcome, scores)

    sleep 2
    system('clear')

    if scores.values.max == WINS_PER_ROUND
      display_grand_winner(scores)
      break
    end
  end

  program_end = true unless play_again?
  system('clear')
end
