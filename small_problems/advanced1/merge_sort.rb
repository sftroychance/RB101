def merge(array1, array2)
  new_arr = []

  arr1 = array1.dup
  arr2 = array2.dup

  until arr1.empty? || arr2.empty?
    arr1[0] < arr2[0] ? (new_arr << arr1.shift) : (new_arr << arr2.shift)
  end

  new_arr + arr1 + arr2
end

def merge_sort_iterative(arr)
  arr2 = arr.map { |val| [val] }

  until arr2.size == 1
    arr2.push(merge(arr2.shift, arr2.shift))
  end

  arr2.flatten(1)
end

def merge_sort(arr)
  return arr if arr.size == 1

  arr1, arr2 = arr.partition.with_index { |_, idx| idx < arr.size / 2 }

  arr1 = merge_sort(arr1)
  arr2 = merge_sort(arr2)

  merge(arr1, arr2)
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

p merge_sort_iterative([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort_iterative([5, 3]) == [3, 5]
p merge_sort_iterative([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort_iterative(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort_iterative([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
