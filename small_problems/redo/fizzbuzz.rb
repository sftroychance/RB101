def fizzbuzz(start, stop)
  (start..stop).each do |num|
    if num % 15 == 0
      puts 'FizzBuzz'
    elsif num % 5 == 0
      puts 'Buzz'
    elsif num % 3 == 0
      puts 'Fizz'
    else
      puts num
    end
  end
end

fizzbuzz(1, 10)
fizzbuzz(25, 93)
