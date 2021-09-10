# Add up all of the ages from the Munster family hash:
#
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

total_ages = ages.values.reduce(:+)
# total_ages = ages.values.sum
p total_ages
