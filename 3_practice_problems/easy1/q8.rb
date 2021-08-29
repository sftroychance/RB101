# Given the hash below

# flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# Turn this into an array containing only two elements: Barney's name and Barney's number

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

barney_array = flintstones.select { |k, _| k == 'Barney' }.to_a.flatten
p barney_array

# per solution, more concise
barney_array = flintstones.assoc("Barney")
p barney_array
