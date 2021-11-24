=begin
P:
summary: for a given odd number, display a diamond the width and height of that number
input: an int
output: display of a diamond

implicit rules:
explicit rules: the argument will always be an odd integer

questions:

E:


D:


A:
iterate over the given number x
  print nth increasing odd number of * centered over field of size x
  print x number of *
  print nth decreasing odd number of * centered over field of size x

=end
def diamond(int)
  1.upto(int) { |ctr| puts ('*' * ctr).center(int) if ctr.odd? }
  (int - 2).downto(1) { |ctr| puts ('*' * ctr).center(int) if ctr.odd? }
end

diamond(3)
diamond(9)
