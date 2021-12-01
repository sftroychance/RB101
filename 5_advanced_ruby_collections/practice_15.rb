# Given this data structure write some code to return an array which contains
# only the hashes where all the integers are even.
#
# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
#
# A: this is an array of hashes. select on the array conditional on all
#     values being even
#

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

output =
  arr.select do |hash|
    hash.values.all? do |value_array|
      value_array.all? do |element|
        element.even?
      end
    end
  end

p output
