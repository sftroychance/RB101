# Sort the given strings in alphabetical order, case insensitive. For example: Do not use #sort or #sort_by
#
# ["Hello", "there", "I'm", "fine"]  -->  ["fine", "Hello", "I'm", "there"]
# ["C", "d", "a", "B"])              -->  ["a", "B", "C", "d"]
#
=begin
  I: array of strings
  O: array of strings

  R: don't use sort or sort_by

  D: array

  A:
    - define method
    - initialize output array
    - find lowest_earliest) word
    arr.size times do
      temp = arr[0]
    - (0...array.size) do
        if temp > current_word
        current_word = temp
      end

      output << temp
      arr.delete(temp)
    end

=end

def sortme(arr)
  output = []

  (arr.size).times do
    temp = arr[0]

    (0...arr.size).each do |idx|
      if temp.downcase > arr[idx].downcase
        temp = arr[idx]
      end
    end

    output << temp
    arr.delete(temp)
  end

  output
end

 p sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"]
 p sortme(["C", "d", "a", "Ba", "be"]) == ["a", "Ba", "be", "C", "d"]
 p sortme(["CodeWars"]) == ["CodeWars"]
