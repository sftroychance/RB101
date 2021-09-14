# Write a method that will take a short line of text, and print it within a box.
#
# Example:
#
# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
#
=begin
P:
summary: a method that prints a short line of text within a banner box
input: a string
output: print to screen

implicit rules: + on the corners, -- horizontal lines, | vertical lines, one
space gap between text and box horizontally; one line gap between text and box
vertically; five lines of text output total

explicit rules: The line of text will fit the terminal window

questions:

E:

D:
hash with graphic elements

A:
1. create method with string parameter.
2. get length of string
3. create hash with horizontal and blank lines based on string length, as well as text prefix/suffix elements.
4. print output.

Further exploration:
Word-wrapping long text
  max line size is 80 -> max text line size is 76
  split string into array
  build individual lines to keep length under 76 and not split a word
  build box line by line
=end

MAX_LINE_LENGTH = 80
MAX_STRING_LENGTH = MAX_LINE_LENGTH - 4

def split_string(string)
  str_arr = string.split

  lines = ['']
  line_index = 0

  str_arr.each do |word|
    if lines[line_index].size + word.size + 2 <= MAX_STRING_LENGTH
      lines[line_index] << word << ' '
    else
      line_index += 1
      lines[line_index] = word + ' '
    end
  end

  lines.map(&:chop)
end

def print_in_box(string)
  lines = split_string(string)
  if lines.size > 1
    field = lines.max { |a, b| a.size <=> b.size }.size + 2
  else
    field = string.size + 2
  end

  horiz = '+' + '-' * field + '+'
  blank = '|' + ' ' * field + '|'

  puts horiz
  puts blank

  lines.each do |line|
    puts '|' + ' ' + line.ljust(field - 1) + '|'
  end

  puts blank
  puts horiz

end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('Troy')
print_in_box('this is a long line this is a long line this is a long line this is a long line this is a long line this is a long line this is a long line this is a long line this is a long line this is a long line this is a long line this is a long line')
print_in_box('This is a fairly straightforward solution. To simplify matters, we start out by setting horizontal_rule and empty_line to appropriate values for the top and bottom 2 lines of the box.')
