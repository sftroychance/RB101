require 'benchmark'

Benchmark.bm do |benchmark|
  benchmark.report('n + 1') do
    100_000.times do
      [1, 2, 3].map {|n| n + 1}
    end
  end

  benchmark.report('n += 1') do
    100_000.times do
      [1, 2, 3].map {|n| n += 1}
    end
  end

end

