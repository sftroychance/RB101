=begin
P:
summary: a method that, given three angles, determines if they would form a
valid triangle, and what type of triangle (as a symbol)
input: three angles
output: if valid, type of triangle represented by the three angles formatted as
a symbol

implicit rules:
explicit rules:
- sum of angles must be 180
- all angles must be > 0
- acute angle: all angles < 90
- right angle: one angle is 90
- obtuse angle: one angle > 90

questions:

E:
triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid


D:
- import sides as an array to use array methods

A:
- import to method as an array (*args)
- verify size of array == 3
- determine validity of triangle (all angles > 0, sum 180)
- determine triangle type (#any? or #all?) and return symbol representing type


=end
def triangle(*args)
  return nil if args.count != 3

  if args.sum != 180 || args.any? { |x| x <= 0 }
    :invalid
  elsif args.any? { |x| x == 90 }
    :right
  elsif args.any? { |x| x > 90 }
    :obtuse
  elsif args.all? { |x| x < 90 }
    :acute
  end

end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
