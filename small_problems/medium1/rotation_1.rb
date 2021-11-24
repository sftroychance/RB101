def rotate_array(arr)
  arr_working = arr.dup
  arr_working.push(arr_working.shift)
  arr_working
end

def rotate_string(str)
  # str[1..] + str[0]

  rotate_array(str.chars).join
end

def rotate_integer(num)
  # str = num.digits.reverse.join
  # rotate_string(str).to_i

  # rotate_array(num.digits.reverse).join.to_i

  rotate_string(num.to_s).to_i
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

p rotate_string('abcde') == 'bcdea'

p rotate_integer(123) == 231
