=begin
P:
summary: a method that, given a number, will find the next 'featured' number
following that one; 'featured' is defined in the rules below
input: a number
output: next featured number

implicit rules: the number has 10 digits at most (since each digit can appear
only once)
explicit rules:
a featured number:
- odd number
- multiple of 7
- each digit in the number appears in the number only once

questions:

E:
featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

D:

A
- a method that takes a number
- return nil if more than 10 digits in the number
- find the next odd number following the given number that is a multiple of 7
- iterate, adding 14 to the number each time (adding 7 to an odd number will result in even number)
  - return number if each digit in the number appears only once (tally digits, max value == 1)

refactoring after viewing official solution:
- can simply add 1 to number until it becomes odd and multiple of 7 (as opposed
  to 1.upto(14)
- val.digits == val.digits.uniq is more succinct than val.digits.tally.values.max == 1
=end

ERR = 'There is no possible number that fulfills those requirements.'

def featured(num)
  return ERR if num.digits.count > 10

  # start_value = num
  # 1.upto(14) do |x|
  #   start_value = num + x if (num + x) % 7 == 0 && (num + x).odd?
  # end
  start_value = num + 1
  start_value += 1 until start_value % 7 == 0 && start_value.odd?

  start_value.step(by: 14) do |val|
    return ERR if val.digits.count > 10
    # return val if val.digits.tally.values.max == 1
    return val if val.digits == val.digits.uniq
  end

end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
