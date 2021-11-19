def oddities(arr)
  arr.select.with_index { |_, idx| idx.even? }
end

p oddities([1, 3, 5])
p oddities(['abc', 'def'])
p oddities([123])
