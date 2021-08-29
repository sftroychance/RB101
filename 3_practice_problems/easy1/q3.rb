# Replace the word "important" with "urgent" in this string:

# advice = "Few things in life are as important as house training your pet dinosaur."

advice = "Few things in life are as important as house training your pet dinosaur."

advice.sub!('important', 'urgent') # also gsub! but there is only one occurrence
p advice
