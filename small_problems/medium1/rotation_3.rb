def rotate_array(arr)
  arr_working = arr.dup
  arr_working.push(arr_working.shift)
end

def rotate_rightmost_digits(int, count)
  arr = int.digits.reverse
  (arr[0...-count] + rotate_array(arr[-count..-1])).join.to_i
end

def max_rotation(int)
  iterations = int.to_s.size

  iterations.downto(2) do |iter|
    int = rotate_rightmost_digits(int, iter)
  end

  int
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
