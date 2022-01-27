def transpose(arr)
  new_arr = Array.new(arr[0].size) { Array.new(arr.size) }

  arr.each_with_index do |subarr, idx1|
    subarr.each_with_index do |value, idx2|
      new_arr[idx2][idx1] = value
    end
  end

  new_arr
end

def rotate90(arr)
  transpose(arr.reverse)
end

def rotate(arr, deg=90)
  new_arr = []

  new_arr = transpose(arr.reverse) if deg / 90 >= 1

  (deg / 90 - 1).times do
    new_arr = transpose(new_arr.reverse)
  end

  new_arr
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

p rotate(matrix1)
p rotate(matrix1, 180)
p rotate(matrix1, 270)
p rotate(matrix1, 360)
