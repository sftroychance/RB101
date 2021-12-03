# Write a method that takes an Array as an argument, and sorts that Array using
# the bubble sort algorithm. Note that your sort will be "in-place"; that is,
# you will mutate the Array passed as an argument. You may assume that the Array
# contains at least 2 elements.
#
# A bubble sort works by making multiple passes (iterations) through the Array.
# On each pass, each pair of consecutive elements is compared. If the first of
# the two elements is greater than the second, then the two elements are
# swapped. This process is repeated until a complete pass is made without
# performing any swaps; at that point, the Array is completely sorted.
#
# array = [5, 3]
# bubble_sort!(array)
# array == [3, 5]
#
# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# array == [1, 2, 4, 6, 7]
#
# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
#
=begin
P:
summary: a method that returns an array sorted, using the bubble sort method
input: an array
output: a sorted array

implicit rules:
explicit rules: must be a bubble sort:

questions:

E:
array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

D:
arrays

A:
  - set a flag denoting whether a swapless pass has been made
  - until flag is true
  - set flag to true
  - iterate over array, comparing every pair of consecutive elements on each pass
    - swap elements if first element is greater than the second; set flag to false
    - set flag to true if a pass is made with no swaps
  - return nil (array changed in place)

  Further exploration: as the array is iterated over, the final elements remain sorted,
  so decrease the endpoint of the iteration each time

=end

def bubble_sort!(arr)
  loop do
    swapped = false
    final = arr.size - 1 # optimization

    (1..final).each do |idx| # optimization
      if arr[idx - 1] > arr[idx]
        arr[idx - 1], arr[idx] = arr[idx], arr[idx - 1]
        swapped = true
      end

      final -= 1 # optimization
    end

    break unless swapped
  end

  nil
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
