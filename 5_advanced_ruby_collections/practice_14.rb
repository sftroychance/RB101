# Given this data structure write some code to return an array containing the
# colors of the fruits and the sizes of the vegetables. The sizes should be
# uppercase and the colors should be capitalized.
#
# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }
# The return value should look like this:
# [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
#
# A: each_with_object, inner loop to access the individual hash values
#

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

output =
hsh.each_with_object([]) do |(_, v), arr|
  if v[:type] == 'fruit'
    arr << v[:colors].map(&:capitalize)
  elsif v[:type] == 'vegetable'
    arr << v[:size].upcase
  end
end

p output

# I notice that with hashes I'm getting confused with what level I'm at in each
# loop; here, at first I tried to apply #each to the hash values (inside the
# each_with_object block), which doesn't make sense. I've noticed in a few of
# the exercises it takes me a few tries to figure it out. Look more closely at
# the hashes--this one at first looked like a hash of hashes, but it is a hash
# where the values are hashes.
#
# Note that a map would have been a better solution than each_with_object
# since map called on a hash will return an array; recall that with map
# the final statement (in this case, in the if clauses) will be what is returned
# to the new array


hsh2 = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

output =
hsh2.map do |_, data|
  if data[:type] == 'fruit'
    data[:colors].map(&:capitalize)
  elsif data[:type] == 'vegetable'
    data[:size].upcase
  end
end

p output
