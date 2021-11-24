words = { noun: '', verb: '', adjective: '', adverb: '' }

words.keys.each do |pos|
  puts "Enter 1 #{pos.to_s}:"
  words[pos] = gets.chomp
end

puts "The #{words[:adjective]} #{words[:noun]} tried to #{words[:verb]} #{words[:adverb]}! Funny!"
