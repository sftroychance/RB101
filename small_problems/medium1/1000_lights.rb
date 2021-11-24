def switch_it(int)
  lights = [true] * int

  2.upto(int) do |iteration|
    lights.map!.with_index do |light, idx|
      (idx + 1) % iteration == 0 ? light = !light : light
    end
  end

  result = []
  lights.each_with_index do |light, idx|
    result << idx + 1 if light
  end

  result
end

p switch_it(5) == [1, 4]
p switch_it(6)
p switch_it(7)
p switch_it(10) == [1, 4, 9]
p switch_it(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]
