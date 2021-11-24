def multiply_list(arr1, arr2)
  # arr1.each_with_index.map { |v, idx| v * arr2[idx] }
  # arr1.zip(arr2).map { |val1, val2| val1 * val2 }
  arr1.zip(arr2).map { |v| v.inject(&:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
