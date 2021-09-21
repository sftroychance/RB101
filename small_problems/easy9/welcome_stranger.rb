# Create a method that takes 2 arguments, an array and a hash. The array will
# contain 2 or more elements that, when combined with adjoining spaces, will
# produce a person's name. The hash will contain two keys, :title and
# :occupation, and the appropriate values. Your method should return a greeting
# that uses the person's full name, and mentions the person's title and
# occupation.
#
# Example:
#
# greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

=begin
P:
summary: a method that takes an array containing elements of name and a hash containing elements of a title and occupation.  output a string that uses these elements in a welcome message.
input: an array, a hash
output: a string

implicit rules: use all the elements of the array and hash provided to generate output
explicit rules:

questions:

E:

D:

A:
1. create a method that takes an array and a hash as parameters
2. join each of the arrays to create name and title/occupation
3. print a string that uses the name and title/occupation to welcome that person
4. return the string.

=end

def greetings(name_arr, title_hash)
  name = name_arr.join(' ')
  title = title_hash.values.join(' ')

  "Welcome #{name}! Your title of #{title} is impressive!"
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
