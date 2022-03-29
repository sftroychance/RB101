# 11:24
# 11:29
# alt 11:43
=begin
# Write a method same_char_collapse that takes in a string and
# returns a collapsed version of the string.

# To collapse the string,
# we repeatedly delete 2 adjacent characters that are the same until
# there are no such adjacent characters. If there are multiple pairs that
# can be collapsed, delete the leftmost pair first before
# moving onto the next pair.

# For example, we take the
# following steps to collapse “zzzxaaxy”: zzzxaaxy -> zxaaxy -> zxxy -> zy

I: string
O: string

R: delete only two adjacent characters at a time.

D: (array?)

A:
- initialize method that takes one string parameter
- loop until string does not match regex for repeat characters (/(.)\1/)
   -replace the repeat characters with a ''
- return remaining string

alt:
- init method
- loop
  -init working_chars = string.chars
  - set replace flag = false
  -iterate over working_characters of string with index
    if char[idx + 1] == char
      string.sub
      replace = true
    end
  end iter
    break unless replace
  end
  string
=end

def same_char_collapse(string)
  # until !(string =~ /(.)\1/)
  #   string.sub!(/(.)\1/, '')
  # end

  loop do
    working_chars = string.chars

    replace = false

    working_chars.each_with_index do |char, idx|
      if char == string[idx + 1]
        string.sub!("#{char}#{char}", '')
        replace = true
      end
    end

    break unless replace

  end

  string
end

p same_char_collapse('zzzxaaxy') == 'zy'
p same_char_collapse('uqrssrqvtt') == 'uv'
p same_char_collapse('aabcddce') == 'be'
p same_char_collapse('uqrssrqvtt') == 'uv'

