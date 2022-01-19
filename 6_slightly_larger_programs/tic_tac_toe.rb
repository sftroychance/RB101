require 'yaml'
MESSAGES = YAML.load_file('ttt_messages.yml')

EMPTY = ' '
PLAYER = 'X'
COMPUTER = 'O'

def prompt(action, data='', exclamation='')
  puts "=> #{MESSAGES[action]} #{data}#{exclamation}"
end

def display_intro
  system('clear')
  prompt(:welcome)
end

def get_first_turn
  prompt(:first_turn)

  response = ''

  loop do
    response = gets.chomp.to_i
    break if response.between?(1, 3)
    prompt(:inv_turn)
  end

  case response
  when 1
    'Player'
  when 2
    'Computer'
  else
    ['Player', 'Computer'].sample
  end
end

def get_grid_size
  prompt(:grid)

  response = ''

  loop do
    response = gets.chomp.to_i
    break if response.between?(3, 9)
    prompt(:inv_grid)
  end

  response
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

  space = (1..(board.size * board.size)).each

  (1..(board.size * 4 - 1)).each do |row|
    print ' ' * 12 if board.size == 3
    (1..(board.size * 6 - 1)).each do |col|
      if row % 4 == 0 && col % 6 == 0
        print '+'
      elsif row % 4 == 0
        print '-'
      elsif col % 6 == 0
        print '|'
      elsif row % 2 == 0 && col % 3 == 0
        print marks.shift
      elsif board.size > 3 && row % 4 == 3
        if col % 6 == 1
          if available_spaces(board).include?(space.peek)
            print space.next.to_s.center(2)
          elsif available_spaces(board).none?(space.peek)
            space.next
            print '  '
          end
        elsif col % 6 == 2
          print ''
        else
          print ' '
        end
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

def player_turn(board)
  choice = 0

  loop do
    prompt(:select)
    puts joinor(available_spaces(board)) if board.size == 3
    choice = gets.chomp.to_i
    break if available_spaces(board).include?(choice)
    prompt(:inv_square)
  end

  mark_choice!(board, choice, PLAYER)
end

def computer_turn(board)
  # computer picks a move if it will win
  available_spaces(board).each do |space|
    mark_choice!(board, space, COMPUTER)
    if get_winner(board) == 'Computer'
      return
    else
      mark_choice!(board, space, EMPTY)
    end
  end

  # computer picks a move if it will block
  available_spaces(board).each do |space|
    mark_choice!(board, space, PLAYER)
    if get_winner(board) == 'Player'
      mark_choice!(board, space, COMPUTER)
      return
    else
      mark_choice!(board, space, EMPTY)
    end
  end

  # computer picks center space if it is empty
  center = ((board.size * board.size) + 1) / 2
  if available_spaces(board).include?(center) && board.size.odd?
    mark_choice!(board, center, COMPUTER)
    return
  end

  # computer picks a random space
  mark_choice!(board, available_spaces(board).sample, COMPUTER)
end

def mark_choice!(board, choice, mark)
  choice -= 1

  board[(choice / board.size)][(choice % board.size)] = mark
end

def full_board?(board)
  board.flatten.none?(' ')
end

def get_all_lines(board)
  flip = board.transpose
  diag1 = (0..(board.size - 1)).map { |i| board[i][i] }
  diag2 = (0..(board.size - 1)).map { |i| board.reverse[i][i] }

  board + flip + [diag1] + [diag2]
end

def get_winner(board)
  get_all_lines(board).each do |line|
    if line.all?(PLAYER)
      return 'Player'
    elsif line.all?(COMPUTER)
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

def switch_player(current_player)
  if current_player == 'Player'
    'Computer'
  else
    'Player'
  end
end

def next_turn(board, current_player)
  if current_player == 'Player'
    player_turn(board)
  else
    computer_turn(board)
  end
end

loop do
  score = { Player: 0, Computer: 0 }

  display_intro

  first_turn = get_first_turn
  grid_size = get_grid_size

  until score.values.max == 5
    board = Array.new(grid_size) { Array.new(grid_size, EMPTY) }

    current_player = first_turn

    loop do
      display_board(board, score)

      next_turn(board, current_player)

      current_player = switch_player(current_player)

      break if winner_found?(board) || full_board?(board)
    end

    display_board(board, score)

    if winner_found?(board)
      winner = get_winner(board)
      score[winner.to_sym] += 1
      display_board(board, score)
      prompt(:winner, winner, '!')
    else
      prompt(:tie)
    end

    puts
    prompt(:enter)
    gets
  end

  display_board(board, score)

  prompt(:game_winner, winner, '!!!')
  if winner == 'Player'
    prompt(:congrats)
  end

  prompt(:play_again)
  break unless gets.chomp.downcase.start_with?('y')
end

prompt(:goodbye)
