# Given this code, what would be the final values of a and b? Try to work this out without running the code.
#
# a = 2
# b = [5, 8]
# arr = [a, b]
#
# arr[0] += 2
# arr[1][0] -= a
#
# A: the final value of a will be 4; the final value of b will be [1, 8]

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

p a, b, arr
# wrong answers! []= is mutating, but [] += is not mutating!
# the correct answers: the final value of a will be 2; the final value of b will
# be [3, 8], the final value of arr will be [4, [3, 8]]
