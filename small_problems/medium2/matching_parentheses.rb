=begin
P:
summary: given a string, determine if ( and ) are properly balanced
input: a string
output: boolean

implicit rules: ( must occur before ) to be considered balanced
explicit rules:

questions:

E:
balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false

D:
intermediate arrays (possibly) to monitor count

A:
- scan string for ( and ) characters into an array
- count ( and ) and return false if not equal
- traverse the array
  - false if count of ) exceeds count of ( at any time

further exploration:
check {} and [] also, as well as ' and "
- constant array containing matching pairs and regex
- use regex to find pairs
- compare tally values for each pair, return false if not equal
- return false if ' and " not even number (though this would not account for apostrophes)
- for matching pairs, iterate over constant array to check balance, return false
  if closing count ever exceed open count

=end

PAIRS = { parens: { l: '(', r: ')', regex: "[()]" },
          braces: { l: '{', r: '}', regex: '[{}]' },
          brackets: { l: '[', r: ']', regex: '[\[\]]' } }

def balanced?(str)
  return false if str.count("'").odd?
  return false if str.count('"').odd?

  results = {}
  PAIRS.keys.each do |k|
    results[k] = str.scan(/#{PAIRS[k][:regex]}/)
  end

  results.each do |k, v|
    return false if v.count(PAIRS[k][:l]) != v.count(PAIRS[k][:r])

    tally = 0
    v.each do |char|
      char =~ /#{Regexp.quote(PAIRS[k][:l])}/ ? (tally += 1) : (tally -= 1)
      return false if tally < 0
    end
  end

  true
end

p balanced?('hi ((how)) are you') == true
p balanced?('hi {{how} are you}') == true
p balanced?('hi [how] are you') == true
p balanced?('hi ((how) are you') == false
p balanced?('hi {{how} are you') == false
p balanced?('hi [[how] are you') == false
p balanced?('hi (how))( are you') == false
p balanced?('hi {how}}{ are you') == false
p balanced?('hi [how]][ are you') == false
p balanced?('(hi there {how} are [you])') == true
p balanced?('(hi there }how{ are [you])') == false
p balanced?('i said "hi"') == true
p balanced?("i said 'hi'") == true
p balanced?("i said 'hi") == false
p balanced?('I said "hi') == false
