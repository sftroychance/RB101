# You are given a method named spin_me that takes a string as an argument and
# returns a string that contains the same words, but with each word's characters
# reversed. Given the method's implementation, will the returned string be the
# same object as the one passed in as an argument or a different object?
#
# I would expect it to be a different object. str is being split into an array
# and then each is called, and the array is what is being mutated within the
# each method, not the original string; then the elements of that array are
# joined into a new string being returned by the method.

def spin_me(str)
  p str.object_id
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

string = "hello world"
p string.object_id

new_str = spin_me(string) # "olleh dlrow"
p new_str.object_id


