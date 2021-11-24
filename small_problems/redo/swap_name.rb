def swap_name (str)
  # str.split[1] + ', ' + str.split[0]
  str.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
