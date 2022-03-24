# 11:39
# 12:09
=begin
You have a positive number n consisting of digits. You can do at most one operation: Choosing the index of a digit in the number, remove this digit at that index and insert it back to another or at the same place in the number in order to find the smallest number you can get.

Task:

Return an array or a tuple or a string depending on the language (see "Sample Tests") with

the smallest number you got
the index i of the digit d you took, i as small as possible
the index j (as small as possible) where you insert this digit d to have the smallest number.
Examples:

smallest(261235) --> [126235, 2, 0] or (126235, 2, 0) or "126235, 2, 0"
126235 is the smallest number gotten by taking 1 at index 2 and putting it at index 0

smallest(209917) --> [29917, 0, 1] or ...

[29917, 1, 0] could be a solution too but index `i` in [29917, 1, 0] is greater than
index `i` in [29917, 0, 1].
29917 is the smallest number gotten by taking 2 at index 0 and putting it at index 1 which gave 029917 which is the number 29917.

smallest(1000000) --> [1, 0, 6] or ...

I: integer
O: array of integers: [lowest_value, old_index, new_index]

R: if multiple solutions get the same lowest value, return the one with the smallest initial index

D: array

A:
- def method that takes an integer parameter
- convert the integer to a string (orig_str)
- initialize a candidates array
- arr = orig_str.chars
  iterate over arr with index idx1
    - iterate (0...arr.size) idx2
    - arr.insert(idx2, arr.delete_at(idx1))
    - candidates << [arr.join.to_i idx1, idx2]
- sort candidates by [str, idx1]
- return first candidate
=end

def smallest(num)
  candidates = []

  # (0...num.digits.size).each do |idx1|
  #   (0...num.digits.size).each do |idx2|
  #     arr = num.to_s.chars
  #     arr.insert(idx2, arr.delete_at(idx1))
  #     candidates << [arr.join.to_i, idx1, idx2]
  #   end
  # end

  (0...num.digits.size).to_a.permutation(2) do |idx1, idx2|
    arr = num.to_s.chars
    arr.insert(idx2, arr.delete_at(idx1))
    candidates << [arr.join.to_i, idx1, idx2]
  end

  #candidates.min_by { |a, b, c| [a, b] }
  # candidates.sort.first
  candidates.min # with subarrays, min will compare element by element anyway
end

p smallest(261235) == [126235, 2, 0]
p smallest(209917) == [29917, 0, 1]
p smallest(285365) == [238565, 3, 1]
p smallest(269045) == [26945, 3, 0]
p smallest(296837) == [239687, 4, 1]
