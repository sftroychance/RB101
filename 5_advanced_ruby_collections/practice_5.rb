# Given this nested Hash:
#
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }
# figure out the total age of just the male members of the family.
#
# A: select statement to get just the male members into a hash
#    then possibly inject or iterate to collect ages and add them

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

p munsters.map { |_, data| data['gender'] == 'male' ? data['age'] : 0 }.sum

# per solution:
total_age = 0
munsters.each_value do |data|
  total_age += data['age'] if data['gender'] == 'male'
end
p total_age

# spent a lot of time trying to see how to do this with #inject, but finding
# it too hard to drill down to the values I need
