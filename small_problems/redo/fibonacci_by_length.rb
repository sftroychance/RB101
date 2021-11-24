def find_fibonacci_index_by_length(int)
  fib = [1, 1]
  (2..).each do |iteration|
    fib << (fib[iteration - 1] + fib[iteration - 2])
    break if fib.last.to_s.size == int
  end

  fib.size
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(3) == 12
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
