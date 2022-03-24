=begin
The input is a string str of digits. Cut the string into chunks (a chunk here is a substring of the initial string) of size sz (ignore the last chunk if its size is less than sz).
If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2, reverse that chunk; otherwise rotate it to the left by one position. Put together these modified chunks and return the result as a string.
If
sz is <= 0 or if str is empty return ""
sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".
Examples:
revrot("123456987654", 6) --> "234561876549"
revrot("123456987653", 6) --> "234561356789"
revrot("66443875", 4) --> "44668753"
revrot("66443875", 8) --> "64438756"
revrot("664438769", 8) --> "67834466"
revrot("123456779", 8) --> "23456771"
revrot("", 8) --> ""
revrot("123456779", 0) --> ""
revrot("563000655734469485", 4) --> "0365065073456944"

I: a string and an integer
O: String representation of an integer or empty string

R: ignore chunk smaller than indicated size
if chunk is an integer where sum of cubes of digits is divisible by 2, reverse chunk, otherwise rotate left

D: array

A:
  - define method that takes one string and one integer parameter
  - split the string into chunks of size n (scan(/.{n}/))
  - map over array
    - if sum of cubes of digits is div by 2, reverse
    - else shift left (array.push(array.shift))
  - join array and return
=end

def revrot(str, size)
  str.scan(/.{#{size}}/)
    .map { |word| word.split('') }
    .map! do |subarr|
      if subarr.map(&:to_i).inject(0) { |sum, val| sum + val ** 3 } % 2 == 0
        subarr.reverse.join
      else
        subarr.push(subarr.shift).join
      end
    end
    .join
end

p revrot("1234", 0) == ""
p revrot("", 0) == ""
p revrot("1234", 5) == ""
p revrot("733049910872815764", 5) == "330479108928157"
p revrot("123456987654", 6) == "234561876549"
p revrot("123456987653", 6) == "234561356789"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("", 8) == ""
p revrot("123456779", 0) == ""
p revrot("563000655734469485", 4) == "0365065073456944"
