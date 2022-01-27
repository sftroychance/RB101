# Write a method that displays an 8-pointed star in an nxn grid, where n is an
# odd integer that is supplied as an argument to the method. The smallest such
# star you need to handle is a 7x7 grid.
#
# star(7)
#
# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *
#
# analyzing the pattern, given n:
# the center line print n number of stars
# a total of n number of lines are printed
# each line past the center line prints 3 stars centered with increasing number
# of spaces between each, as follows:
# 1 line above and 1 line below: 3 stars, 0 spaces between them
# 2 lines above and below: 3 stars, 1 space between them
# 3 lines above and below: 3 stars, 2 spaces between them
# -> the pattern is '*' + ' ' * line - 1 + '*' --all that centered over n spaces
#

def star(num)
  print_lines = []

  iterations = num / 2

  (0...iterations).each do |line|
    # print_lines[line] = ('*' + ' ' * line + '*' + ' ' * line + '*').center(num)
    print_lines[line] = ('***'.split('').join(' ' * line)).center(num)
  end

  print_lines.reverse.each {|line| puts line}

  puts '*' * num

  print_lines.each {|line| puts line }
end

def sine_wave(height)
  print_lines = []

  (0...height).each do |line|
    print_lines[line] = (' ' * (height - line - 1) + '*' + ' ' * (2 * line) + '*')
  end

  print_lines.each { |line| puts line }

  print_lines.reverse.each_with_index do |line, idx|
    print ' ' * ((height * 2) + idx)
    puts line.reverse
  end



end
star(31)

sine_wave(6)

sine_wave(12)
