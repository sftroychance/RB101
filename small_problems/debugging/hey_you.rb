# We are converting the string into an array of characters and calling
# the each method on that array in order to call upcase! on each character.
# We could call map on the array of characters to change each one and
# then assign the result of #map to the name variable; however, the original
# string can be upcased simply by calling #upcase! on the string itself--no
# array conversion necessary.

def shout_out_to(name)
  # name.chars.each { |c| c.upcase! }
  # name = name.chars.map { |c| c.upcase! }.join
  name.upcase!

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'
