def triangle(*args)
  return nil if args.count != 3

  return :invalid if args.min(2).sum <= args.max || args.any? { |x| x <= 0 }

  case args.uniq.count
  when 1 then :equilateral
  when 2 then :isosceles
  when 3 then :scalene
  end

end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
