def halvsies(arr)
  mid = (arr.size / 2.0).ceil
  arr1, arr2 = arr[0...mid], arr[mid..]
  p [arr1, arr2]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
