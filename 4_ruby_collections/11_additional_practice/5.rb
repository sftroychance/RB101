# In the array:
#
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
#
# Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

index =
  flintstones.each_with_index do |name, idx|
    if name.match(/^Be/)
      break idx
    end
  end

# also: flintstones.index { |name| name[0, 2] == "Be" }

p index
