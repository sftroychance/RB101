# The first issue was within #reduce to obtain the sum,
# we were not assigning the result of #map to anything,
# so remaining_cards.sum was not using the scores but
# the elements of the deck array, which include non-integer
# values (the reason we get a TypeError). This is fixed
# if we assign #map to a variable referencing an array of scores
# and then get the sum of that array.
#
# A refactoring note: at the end of #reduce, the return value doesn't
# need to include assignment (=), just the sum of the values; the return
# value of the block is the same either way, but the assignment isn't
# necessary.
#
# After fixing the issue with #map, the program did not calculate
# the sums as expected; the sum of remaining cards was the same for
# each iteration, which indicated that they were referencing the
# same array.  Indeed, when deck is instantiated, the same array object
# is assigned to each key, so when cards are popped from each array,
# they are popped from all the arrays in the deck hash. This is fixed by
# instantiating deck with duplicates or clones of the cards array.
#

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { hearts:   cards.dup,
         diamonds: cards.dup,
         clubs:    cards.dup,
         spades:   cards.dup }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |total, (_, remaining_cards)|
  # remaining_cards.map do |card|
  #   score(card)
  # end
  remaining_scores = remaining_cards.map { |card| score(card) }

  # sum += remaining_cards.sum
  total + remaining_scores.sum
end

puts sum
