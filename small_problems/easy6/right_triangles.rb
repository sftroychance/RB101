# Write a method that takes a positive integer, n, as an argument, and displays
# a right triangle whose sides each have n stars. The hypotenuse of the triangle
# (the diagonal side in the images below) should have one end at the lower-left
# of the triangle, and the other end at the upper-right.
#
# Examples:
#
# triangle(5)
#
#     *
#    **
#   ***
#  ****
# *****
#
# triangle(9)
#
#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********

=begin
P:
summary: a method that takes an integer and prints stars representing a right
triangle with sizes adjacent to the right angle having a length of that many
stars
input: a positive integer
output: printed stars

implicit rules:
explicit rules: the right angle should be at the lower right of the screen

questions:

E:

D:

A:
1. write a method that takes an integer parameter
2. loop
   a. print incrementing numbers of stars right-justified on each line

=end

def triangle(length, right_angle_orientation)
  case right_angle_orientation
  when :BR
    1.upto(length) do |x|
      puts ('*' * x).rjust(length)
    end
  when :BL
    1.upto(length) do |x|
      puts ('*' * x)
    end
  when :UR
    length.downto(1) do |x|
      puts ('*' * x).rjust(length)
    end
  when :UL
    length.downto(1) do |x|
      puts ('*' * x)
    end
  end
end

triangle(5, :BR)
triangle(9, :BL)
triangle(5, :UR)
triangle(9, :UL)
