# Write a method that takes a positive integer or zero, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

# Examples

# integer_to_string(4321) == '4321'
# integer_to_string(0) == '0'
# integer_to_string(5000) == '5000'
CHARS = ('0'..'9').to_a

def integer_to_string(num)
  str = ''

  if num < 10
    str = CHARS[num]
  else
    until num == 0
      num, remainder = num.divmod(10)
      str << CHARS[remainder]
    end
  end

  str.reverse
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# Further Exploration:

# One thing to note here is the String#prepend method; unlike most string mutating methods, the name of this method does not end with a !. However, it is still a mutating method - it changes the string in place. (note: I used <<, which is also mutating)

# This is actually pretty common with mutating methods that do not have a corresponding non-mutating form. chomp! ends with a ! because the non-mutating chomp is also defined. prepend does not end with a ! because there is no non-mutating form of prepend.

# How many mutating String methods can you find that do not end with a !. Can you find any that end with a !, but don't have a non-mutating form? Does the Array class have any methods that fit this pattern? How about the Hash class?

# String methods that are mutating without using !:
# - <<:
#   irb(main):001:0> str = 'a'
#   => "a"
#   irb(main):002:0> str2 = str
#   => "a"
#   irb(main):003:0> str << 'b'
#   => "ab"
#   irb(main):004:0> str2
#   => "ab"

# - []=:
#   irb(main):001:0> str = 'abc'
#   => "abc"
#   irb(main):002:0> str.object_id
#   => 260
#   irb(main):003:0> str[0] = 'd'
#   => "d"
#   irb(main):004:0> str
#   => "dbc"
#   irb(main):005:0> str.object_id
#   => 260

# - clear:
#   irb(main):001:0> str = 'a'
#   => "a"
#   irb(main):002:0> str.object_id
#   => 260
#   irb(main):003:0> str.clear
#   => ""
#   irb(main):004:0> str.object_id
#   => 260

# - concat:
#   irb(main):001:0> str = 'a'
#   => "a"
#   irb(main):002:0> str.object_id
#   => 260
#   irb(main):003:0> str.concat('b')
#   => "ab"
#   irb(main):004:0> str.object_id
#   => 260

# - insert
#   irb(main):001:0> str = 'abc'
#   => "abc"
#   irb(main):002:0> str.object_id
#   => 260
#   irb(main):003:0> str.insert(1, 'xxx')
#   => "axxxbc"
#   irb(main):004:0> str.object_id
#   => 260
#   irb(main):005:0> str
#   => "axxxbc"

# - prepend (as mentioned):
#   irb(main):001:0> str = 'a'
#   => "a"
#   irb(main):002:0> str.object_id
#   => 260
#   irb(main):003:0> str.prepend('x')
#   => "xa"
#   irb(main):004:0> str
#   => "xa"
#   irb(main):005:0> str.object_id
#   => 260

# - replace
#   irb(main):001:0> str = 'a'
#   => "a"
#   irb(main):002:0> str.object_id
#   => 260
#   irb(main):003:0> str.replace('b')
#   => "b"
#   irb(main):004:0> str
#   => "b"
#   irb(main):005:0> str.object_id
#   => 260

# I cannot locate any String methods that end with ! that do not have a corresponding non-mutating version.

# Array has a method sort_by! that does not have a corresponding non-mutating version.
# Array mutating methods not indicated by !:
# - <<
# - []=
# - clear
# - concat
# - delete
# - delete_at
# - delete_if
# - fill
# - insert
# - keep_if
# - pop
# - push
# - repeated_combination
# - repeated_permutation
# - replace
# - shift
# - unshift

# I cannot locate any Hash methods that end with ! that do not have a corresponding non-mutating version.
# Hash mutating methods not indicated by !:
# - []=
# - clear
# - delete
# - delete_if
# - keep_if
# - replace
# - shift
# - store (alias for []=)
