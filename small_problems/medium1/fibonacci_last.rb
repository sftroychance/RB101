def fibonacci_last(num)
  fib = [0, 1]

  2.upto(num) do |idx|
    fib[idx] = fib[idx - 1] % 10 + fib[idx - 2] % 10
  end

  fib[num].to_s[-1].to_i

end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
