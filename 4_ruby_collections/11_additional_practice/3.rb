# In the age hash:
#
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
#
# remove people with age 100 and greater.

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.reject! { |_, v| v >= 100 }
p ages

