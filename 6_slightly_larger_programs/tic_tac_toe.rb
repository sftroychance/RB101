EMPTY = ' '
PLAYER = 'X'
COMPUTER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def display_header(score)
  system('clear')

  puts "--TicTacToe--".center(20) + "--SCORE--".center(20)
  puts "Player is X".center(20) + "PLAYER: #{score[:Player]}".center(20)
  puts "Computer is O".center(20) + "COMPUTER: #{score[:Computer]}".center(20)
  puts
end

def display_board(board, score)
  marks = board.dup.flatten

  display_header(score)

  (1..11).each do |row|
    print ' ' * 12
    (1..17).each do |col|
      if row % 4 == 0 && col % 6 == 0
        print '+'
      elsif row % 4 == 0
        print '-'
      elsif col % 6 == 0
        print '|'
      elsif row % 2 == 0 && col % 3 == 0
        print marks.shift
      else
        print ' '
      end
    end
    puts
  end
  puts
end

def available_spaces(board)
  avail = []

  board.flatten.each_with_index do |val, idx|
    avail << (idx + 1) if val == ' '
  end

  avail
end

def player_turn!(board)
  choice = 0
  loop do
    prompt("Select a square: #{joinor(available_spaces(board))}")
    choice = gets.chomp.to_i
    break if available_spaces(board).include?(choice)
    prompt("That is not a valid square.")
  end

  choice -= 1
  board[(choice / 3)][(choice % 3)] = 'X'
end

def computer_turn!(board)
  choice = available_spaces(board).sample - 1

  board[(choice / 3)][(choice % 3)] = 'O'
end

def full_board?(board)
  !board.flatten.include?(' ')
end

def get_all_lines(board)
  flip = board.transpose
  diagonal1 =  [[board[0][0], board[1][1], board[2][2]]]
  diagonal2 =  [[board[0][2], board[1][1], board[2][0]]]

  board + flip + diagonal1 + diagonal2
end

def get_winner(board)
  get_all_lines(board).each do |row|
    if row.all?(PLAYER)
      return 'Player'
    elsif row.all?(COMPUTER)
      return 'Computer'
    end
  end

  nil
end

def winner_found?(board)
  !!get_winner(board)
end

def joinor(arr, delim=', ', conj='or')
  phrase = arr.join(delim)
    .reverse
    .sub(delim.reverse, ' ' + conj.reverse + delim.reverse)
    .reverse


  if arr.size == 2
    phrase.sub!(',', '')
  end

  phrase
end

loop do
  wins = {Player: 0, Computer: 0}

  until wins.values.max == 5
    board = Array.new(3) { Array.new(3, EMPTY) }

    loop do
      display_board(board, wins)

      player_turn!(board)
      break if winner_found?(board) || full_board?(board)

      computer_turn!(board)
      break if winner_found?(board) || full_board?(board)
    end

    display_board(board, wins)

    if winner_found?(board)
      winner = get_winner(board)
      prompt("#{winner} wins this round!")
      wins[winner.to_sym] += 1
    else
      prompt("It's a tie!")
    end

    sleep(2)
  end

  display_board(board, wins)

  prompt("#{winner} is the first to five wins!")

  prompt("Would you like to play again? (y or n)")
  break unless gets.chomp.downcase.start_with?('y')
end

prompt("Thanks for playing TicTacToe! Goodbye!")
