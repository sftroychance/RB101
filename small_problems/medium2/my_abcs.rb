=begin
P: determine if a word can be spelled with a set of blocks that can display only one of
   two letters
   - each block can be used only once

E:
block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

D: arrays representing blocks

A:
- array constant to represent blocks; each block is a subarray
- duplicate constant to create a working set of 'blocks'
- iterate over each character in given string
  - if the character appears in a subarray, delete that subarray from the array
  - if a character does not appear in the array, return false
- return true if all characters found in the array

=end

BLOCKS = [ ['b', 'o'], ['x', 'k'], ['d', 'q'], ['c', 'p'], ['n', 'a'],
           ['g', 't'], ['r', 'e'], ['f', 's'], ['j', 'w'], ['h', 'u'],
           ['v', 'i'], ['l', 'y'], ['z', 'm'] ]

def block_word?(str)
  working_blocks = BLOCKS.dup

  str.downcase.each_char do |char|
    if working_blocks.flatten.include?(char)
      working_blocks.each_with_index do |subarr, idx|
        if subarr.include?(char)
          working_blocks.delete_at(idx)
          break
        end
      end
    else
      return false
    end
  end

  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

=begin
Analysis: The official solution is much more elegant:

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

As I noticed in the recent fibonacci exercises, I might be tending to rely too
much on using collections to hold onto data where it might not be necessary, as
opposed to seeing other solutions, and this might have implications in efficiency.

Viewing my solution, there's no reason I could not have used an array of strings
instead of subarrays, except that it is how I am organizing the data in my head.

Also, I should keep in mind, with traversal, that when comparing, for instance, a string
with an array constant, there are options to traverse either one, and another option might be
more efficient; I seem to immediately lock in to one reflecting the perspective I'm taking
on the data. Here, I take the perpective of stepping through the string and checking it
character by character. If I'm understanding the terms correctly, it represents a
difference between PROCEDURAL (going step by step) programming and FUNCTIONAL programming,
which seems to be the approach in coming up with #count as a solution here.
=end
