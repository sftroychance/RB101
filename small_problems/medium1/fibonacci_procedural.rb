def fibonacci(num)
  fib = [0, 1]

  2.upto(num) do |idx|
    fib[idx] = fib[idx - 1] + fib[idx - 2]
  end

  fib[num]

end

p fibonacci(1)
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501
