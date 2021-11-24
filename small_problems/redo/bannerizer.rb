MAX_LINE = 80

def print_in_box(str)
  if str.size <= MAX_LINE - 4
    print '+', '-' * (str.size + 2), "+\n"
    print '|', ' ' * (str.size + 2), "|\n"
    print '|', ' ', str, ' ', "|\n"
    print '|', ' ' * (str.size + 2), "|\n"
    print '+', '-' * (str.size + 2), "+\n"
  else
    print '+', '-' * (MAX_LINE - 4), "+\n"
    print '|', ' ' * (MAX_LINE - 4), "|\n"

    arr = str.split
    lines = ['']
    line_ctr = 0

    arr.each do |word|
      if lines[line_ctr].size + word.size > MAX_LINE - 8
        line_ctr += 1
        lines[line_ctr] = ''
        next
      else
        lines[line_ctr] << word << ' '
      end
    end

    if lines.last == ''
      lines.pop
    end

    lines.each do |line|
      print '|', ' ', line.ljust(MAX_LINE - 6), ' ', "|\n"
    end

    print '|', ' ' * (MAX_LINE - 4), "|\n"
    print '+', '-' * (MAX_LINE - 4), "+\n"
  end
end

print_in_box('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
  print_in_box('howdy')
