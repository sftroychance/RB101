def center_of(str)
  # str.size.even? ? str[((str.size / 2) - 1)..(str.size / 2)] : str[(str.size / 2)]
  mid_idx = (str.size / 2.0).ceil - 1
  str.size.even? ? str[mid_idx, 2] : str[mid_idx]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
