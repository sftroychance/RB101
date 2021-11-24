def rotate_array(arr)
  arr_working = arr.dup
  arr_working.push(arr_working.shift)
end

def rotate_rightmost_digits(int, count)
  arr = int.digits.reverse
  (arr[0...-count] + rotate_array(arr[-count..-1])).join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
