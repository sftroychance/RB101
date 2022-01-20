require 'yaml'
MESSAGES = YAML.load_file('ttt_messages.yml')

EMPTY = ' '
PLAYER = 'X'
COMPUTER = 'O'

def prompt(action, data='', exclamation='')
  puts "=> #{MESSAGES[action]} #{data}#{exclamation}"
end

def valid_input?(str, min, max)
  (min.to_s..max.to_s).include?(str)
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

def get_first_turn
  prompt(:first_turn)

  response = ''

  loop do
    response = gets.chomp
    break if valid_input?(response, 1, 3)
    prompt(:invalid)
  end

  case response.to_i
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
    response = gets.chomp
    break if valid_input?(response, 3, 9)
    prompt(:inv_grid)
  end

  response.to_i
end

def get_difficulty(grid_size)
  if grid_size == 3
    max = 3
    prompt(:difficulty)
  else
    max = 2
    prompt(:diff2)
  end

  response = ''

  loop do
    response = gets.chomp
    break if valid_input?(response, 1, max)
    prompt(:invalid)
  end

  response.to_i
end

def display_intro
  system('clear')
  prompt(:welcome)
end

def display_header(score)
  system('clear')

  puts "--TicTacToe--".center(20) + "--SCORE--".center(20)
  puts "Player is X".center(20)   + "PLAYER: #{score[:Player]}".center(20)
  puts "Computer is O".center(20) + "COMPUTER: #{score[:Computer]}".center(20)
  puts
end

def display_board(board, score)
  marks = board.flatten

  display_header(score)

  space = (1..board.size**2).each

  (1..(board.size * 4 - 1)).each do |row|
    print ' ' * 12 if board.size == 3
    (1..(board.size * 6 - 1)).each do |col|
      if row % 4 == 0 && col % 6 == 0
        print '+'
      elsif row % 4 == 0
        print '-'
      elsif col % 6 == 0
        print '|'
      elsif row.even? && col % 3 == 0
        print "\e[31m#{marks.shift}\e[0m"
      elsif board.size > 3 && row % 4 == 3
        if col % 6 == 1
          if space_empty?(board, space.peek)
            print space.next.to_s.ljust(2)
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

def get_center(board)
  (board.size**2 + 1) / 2
end

def get_all_lines(board)
  flip = board.transpose
  diag1 = (0..(board.size - 1)).map { |i| board[i][i] }
  diag2 = (0..(board.size - 1)).map { |i| board.reverse[i][i] }

  board + flip + [diag1] + [diag2]
end

def space_empty?(board, space)
  available_spaces(board).include?(space)
end

def full_board?(board)
  board.flatten.none?(' ')
end

def empty_board?(board)
  board.flatten.all?(' ')
end

def switch_player(current_player)
  if current_player == 'Player'
    'Computer'
  else
    'Player'
  end
end

def next_turn(board, current_player, difficulty)
  if current_player == 'Player'
    player_turn(board)
  else
    computer_turn(board, difficulty)
  end
end

def player_turn(board)
  choice = 0

  loop do
    prompt(:select)
    puts joinor(available_spaces(board)) if board.size == 3
    choice = gets.chomp
    if valid_input?(choice, 1, board.size**2) && space_empty?(board, choice.to_i)
      choice = choice.to_i
      break
    else
      prompt(:inv_square)
    end
  end

  mark_choice!(board, choice, PLAYER)
end

def computer_turn(board, difficulty)
  case difficulty
  when 1
    random_move(board)
  when 2
    winning_move(board) ||
      blocking_move(board) ||
      center_move(board) ||
      random_move(board)
  when 3
    best_move(board)
  end
end

def random_move(board)
  mark_choice!(board, available_spaces(board).sample, COMPUTER)
end

def winning_move(board)
  available_spaces(board).each do |space|
    mark_choice!(board, space, COMPUTER)
    if get_winner(board) == 'Computer'
      return 1
    else
      mark_choice!(board, space, EMPTY)
    end
  end

  nil
end

def blocking_move(board)
  available_spaces(board).each do |space|
    mark_choice!(board, space, PLAYER)
    if get_winner(board) == 'Player'
      mark_choice!(board, space, COMPUTER)
      return 1
    else
      mark_choice!(board, space, EMPTY)
    end
  end

  nil
end

def center_move(board)
  if board.size.odd? && space_empty?(board, get_center(board))
    mark_choice!(board, get_center(board), COMPUTER)
    return 1
  end

  nil
end

def best_move(board)
  if empty_board?(board)
    center_move(board) && return
  end

  best_score = -100
  best_choice = 0

  # shuffle randomizes the computer AI selection
  # amongst multiple moves with equally highest value
  available_spaces(board).shuffle.each do |space|
    mark_choice!(board, space, COMPUTER)

    current_score = minimax(board, 0, false)

    mark_choice!(board, space, EMPTY)

    if current_score > best_score
      best_score = current_score
      best_choice = space
    end
  end

  mark_choice!(board, best_choice, COMPUTER)
end

def minimax(board, depth, computer_turn)
  if get_winner(board) == 'Computer'
    return 10 - depth
  end

  if get_winner(board) == 'Player'
    return -10 + depth
  end

  if full_board?(board)
    return 0
  end

  if computer_turn
    best_path = -100

    available_spaces(board).each do |space|
      mark_choice!(board, space, COMPUTER)

      best_path = [best_path, minimax(board, depth + 1, !computer_turn)].max

      mark_choice!(board, space, EMPTY)
    end
  else
    best_path = 100

    available_spaces(board).each do |space|
      mark_choice!(board, space, PLAYER)

      best_path = [best_path, minimax(board, depth + 1, !computer_turn)].min

      mark_choice!(board, space, EMPTY)
    end
  end

  best_path
end

def mark_choice!(board, choice, mark)
  choice -= 1

  board[(choice / board.size)][(choice % board.size)] = mark
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

loop do
  score = { Player: 0, Computer: 0 }

  display_intro

  first_turn = get_first_turn
  grid_size = get_grid_size
  difficulty = get_difficulty(grid_size)

  until score.values.max == 5
    board = Array.new(grid_size) { Array.new(grid_size, EMPTY) }

    current_player = first_turn

    loop do
      display_board(board, score)

      next_turn(board, current_player, difficulty)

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
