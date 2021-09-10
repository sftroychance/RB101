# Create a hash that expresses the frequency with which each letter occurs in this string:
#
# statement = "The Flintstones Rock"
#
# Example:
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

statement = "The Flintstones Rock"

char_hash = {}

statement.chars.each do |char|
  if char_hash[char]
    char_hash[char] += 1
  else
    char_hash[char] = 1
  end
end

p char_hash
