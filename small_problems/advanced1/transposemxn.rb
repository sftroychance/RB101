def transpose(arr)
  new_arr = Array.new(arr[0].size) { Array.new(arr.size) }

  arr.each_with_index do |subarr, idx1|
    subarr.each_with_index do |value, idx2|
      new_arr[idx2][idx1] = value
    end
  end

  new_arr
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
