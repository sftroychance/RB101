=begin
boats are placed either horizontally, vertically or diagonally on the board. 0 represents a space not boats by a boat. Digits 1-3 represent boats which vary in length 1-4 spaces long. There will always be at least 1 boat up to a maximum of 3 in any one game. Boat sizes and board dimentions will vary from game to game.

Attacks

Attacks are calculated from the bottom left, first the X coordinate then the Y. There will be at least one attack per game, and the array will not contain duplicates.

[[2, 1], [1, 3], [4, 2]]
First attack      `[2, 1]` = `3`
Second attack `[1, 3]` = `0`
Third attack     `[4, 2]` = `1`
Function Initialization

board = [[0,0,0,2,2,0],
         [0,3,0,0,0,0],
         [0,3,0,1,0,0],
         [0,3,0,1,0,0]]
attacks = [[2, 1], [1, 3], [4, 2]]
damaged_or_sunk(board, attacks)
Scoring

1 point for every whole boat sank.
0.5 points for each boat hit at least once (not including boats that are sunk).
-1 point for each whole boat that was not hit at least once.
Sunk or Damaged

`sunk` = all boats that are sunk
`damaged` = all boats that have been hit at least once but not sunk
`notTouched/not_touched` = all boats that have not been hit at least once
Output

You should return a hash with the following data

`sunk`, `damaged`, `not_touched`, `points`
Example Game Output

In our above example..

First attack: `boat 3` was damaged, which increases the `points` by `0.5`
Second attack: miss nothing happens
Third attack: `boat 1` was damaged, which increases the `points` by `0.5`
`boat 2` was untouched so `points -1` and `notTouched +1` in Javascript/Java/C# and `not_touched +1` in Python/Ruby.
No whole boats sank
Return Hash

{ 'sunk': 0, 'damaged': 2 , 'not_touched': 1, 'points': 0 }

I: board ( y coordinates go from 'bottom' up, so reverse the given array) - 2D array
  plays- array of subarrays; subarrays are x,y coordinates [x, y]

O: hash { 'sunk': 0, 'damaged': 2 , 'not_touched': 1, 'points': 0 }

R: boats are 1-4 spaces long, 1-3 boats per game, boats horizontal, vertical, or diagonal
  moves are 1-based (not 0-based like arrays)

D: hash, arrays

A:
  - initialize the hash to hold output
  - reverse the board array so coordinates are consistent with array structure
  - get coordinates of all boats
    - get coordinates with numbers and the numbers at those coordinates: hash number: [num_coords, [ coords ]]

  -process the attacks
    - use boats array
  - look at boats subarray
        - if coordinates lists are empty, a boat has been sunk + increment sunk
          - decrement 'damaged' by the number
        - if any are full (size of the array = the number) - increment not touched
        -else calculate damaged

  - calculate points

=end

def damaged_or_sunk(board, attacks)
  board.reverse!

  boats = Hash.new { Array.new }

  board.each_with_index do |row, y|
    row.each_with_index do |cell, x|
      if cell > 0
        if boats[cell] == []
          boats[cell] = [[x + 1, y + 1]]
        else
          boats[cell] << [x + 1, y + 1]
        end
      end
    end
  end

  boats = boats.map { |k, v| [k, [v.count, v]] }.to_h

  attacks.each do |attack|
    boats.each do |k, v|
      if v[1].include?(attack)
        v[1].delete(attack)
      end
    end
  end

  results = {'sunk'=> 0, 'damaged' => 0, 'not_touched' => 0, 'points' => 0 }

  boats.each do |k, v|
    if v[1].empty?
      results['sunk'] += 1
    elsif v[1].count == v[0]
      results['not_touched'] += 1
    else
      results['damaged'] += 1
    end
  end

  results['points'] = results['sunk'] + (results['damaged'] / 2) - results['not_touched']

  results
end

board = [[0,0,0,2,2,0],
         [0,3,0,0,0,0],
         [0,3,0,1,0,0],
         [0,3,0,1,0,0]]
attacks = [[2, 1], [1, 3], [4, 2]]
p damaged_or_sunk(board, attacks)
