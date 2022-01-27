def merge(array1, array2)
  new_arr = []

  arr1 = array1.dup
  arr2 = array2.dup

  until arr1.empty? || arr2.empty?
    arr1[0] < arr2[0] ? (new_arr << arr1.shift) : (new_arr << arr2.shift)
  end

  new_arr + arr1 + arr2
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
