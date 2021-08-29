# Shorten the following sentence:

# advice = "Few things in life are as important as house training your pet dinosaur."

# Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".

# As a bonus, what happens if you use the String#slice method instead?

advice = "Few things in life are as important as house training your pet dinosaur."

# new_advice = advice.slice!(0..38)
new_advice = advice.slice!('Few things in life are as important as ')
p advice
p new_advice

# solution:
# advice.slice!(0, advice.index('house'))
#
# If you use the String#slice method instead, new_advice would be the same, but it would return the full original string.
