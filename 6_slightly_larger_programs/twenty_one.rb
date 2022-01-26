require 'yaml'
MESSAGES = YAML.load_file('twenty_one_messages.yml')
DEALER_STAY = 17
MAX_POINTS = 21

def prompt(action, data='')
  puts "=> #{data} #{MESSAGES[action]}"
end

def display_intro
  system('clear')
  prompt(:welcome)

  puts
  prompt(:enter)
  gets
end

def initialize_deck!(deck)
  ['Clubs', 'Spades', 'Hearts', 'Diamonds'].each do |suit|
    (('1'..'9').to_a + ['J', 'K', 'Q', 'A']).each do |val|
      deck << [val, suit]
    end
  end

  deck.each do |card|
    if ('1'..'9').include?(card[0])
      card << card[0].to_i
    elsif card[0] == 'A'
      card << 11
    else
      card << 10
    end
  end

  deck.shuffle!
end

def deal_hands!(deck, hands)
  hands.each do |_, v|
    v << deck.pop << deck.pop
  end
end

def display_header(score)
  puts "************".center(20) + "SCORE".center(40)
  puts "Twenty-One".center(20) + "Dealer: #{score[:Dealer]}".center(40)
  puts "************".center(20) + "Player: #{score[:Player]}".center(40)
  puts
end

def display_hands(hands, score, hide_dealer=true)
  system('clear')

  display_header(score)

  hands.each do |person, hand|
    puts "#{person}'s hand:"
    hand.each_with_index do |card, idx|
      if person == :Dealer && idx == 1 && hide_dealer
        puts "\t\?\?\?"
      else
        puts "\t#{card[0]} of #{card[1]}"
      end
    end
    puts "\tBUST!!!" if busted?(hands, person)
    puts
  end
end

def take_turn(deck, hands, score, person)
  hide_card = person == :Player

  loop do
    if person == :Player
      move = player_choice
    else
      move = dealer_choice(hands)
    end

    break if move == 's'

    deal_card!(deck, hands, person)

    sleep(1) if person == :Dealer
    display_hands(hands, score, hide_card)

    break if busted?(hands, person)
  end
end

def player_choice
  prompt(:hitorstay)
  choice = ''

  loop do
    choice = gets.chomp
    break if ['h', 's'].include?(choice[0].downcase)
    prompt(:invalid)
  end

  choice[0].downcase
end

def dealer_choice(hands)
  if hand_score(hands, :Dealer) >= DEALER_STAY
    's'
  else
    'h'
  end
end

def deal_card!(deck, hands, person)
  hands[person] << deck.pop
end

def hand_score(hands, person)
  points = hands[person].transpose[2].sum

  count_aces(hands, person).times do
    points -= 10 if points > MAX_POINTS
  end

  points
end

def count_aces(hands, person)
  hands[person].transpose[0].count('A')
end

def busted?(hands, person)
  hand_score(hands, person) > MAX_POINTS
end

def get_winner(hands)
  dealer_score = hand_score(hands, :Dealer)
  player_score = hand_score(hands, :Player)

  if busted?(hands, :Player) || dealer_score > player_score
    winner = :Dealer
  elsif busted?(hands, :Dealer) || player_score > dealer_score
    winner = :Player
  else
    winner = :Nobody
  end

  winner
end

def display_result(hands, score)
  winner = get_winner(hands)

  score[winner.to_sym] += 1 unless winner == :Nobody

  display_hands(hands, score, false)
  prompt(:winner, winner)
end

def display_game_result(score)
  if score[:Dealer] == score[:Player]
    prompt(:tie)
  else
    winner = score.max_by { |_, v| v }.first
    prompt(:game_winner, winner)
  end

  if winner == :Player
    prompt(:congrats)
  end
end

score = { Dealer: 0, Player: 0 }

display_intro

loop do
  deck = []
  hands = { Dealer: [], Player: [] }

  initialize_deck!(deck)

  deal_hands!(deck, hands)

  display_hands(hands, score)

  take_turn(deck, hands, score, :Player)

  display_hands(hands, score, false)

  if !busted?(hands, :Player)
    take_turn(deck, hands, score, :Dealer)
  end

  display_result(hands, score)

  puts
  prompt(:play_again)
  break unless gets.chomp.downcase.start_with?('y')
end

display_game_result(score)
prompt(:goodbye)
