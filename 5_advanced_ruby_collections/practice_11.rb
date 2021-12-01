# Given the following data structure use a combination of methods, including either the select or reject method, to return a new array identical in structure to the original but containing only the integers that are multiples of 3.
#
# arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
#
# A: will attempt to use arr.each and then .select on each subarray
#
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.each do |subarr|
  subarr.select! { |x| x % 3 == 0 }
end

p arr

# another solution: use map (the above solution doesn't strictly use #select

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr2 =
  arr.map do |subarr|
    subarr.select { |x| x % 3 == 0 }
  end

p arr2
