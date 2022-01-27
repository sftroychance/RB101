def transpose(arr)
  new_arr = []

  (0...arr.size).each do |idx1|
    new_arr << []
    (0...arr[0].size).each do |idx2|
      new_arr[idx1][idx2] = arr[idx2][idx1]
    end
  end

  new_arr
end

def transpose!(arr)
  orig = arr.map(&:dup)

  (0...arr.size).each do |idx1|
    (0...arr[0].size).each do |idx2|
      arr[idx1][idx2] = orig[idx2][idx1]
    end
  end

  arr
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)
puts "non-destructive"
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

puts "destructive"
transpose!(matrix)
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
