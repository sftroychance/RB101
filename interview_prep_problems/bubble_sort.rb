def bubble_sort(arr)
  cycles = arr.size - 1

  loop do
    switched = false

    (0...cycles).each do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        switched = true
        p i
      end
    end

    break if !switched

    cycles -= 1
  end

  arr
end

p bubble_sort([5, 4, 3, 2, 1])
p bubble_sort([1, 2, 3, 4, 5])
