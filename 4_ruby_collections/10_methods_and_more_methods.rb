# 1. What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# => [1, 2, 3]
# The return value from the block will always be 'hi', which is truthy. The
# select method assesses only the boolean result returned by the block. Since
# 'hi' is truthy, every element in the original collection will be returned
# assigned to the new collection, which is the method's return value.

# 2. How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# As with select, count (when called with a block) assesses the truthiness of
# the block's return value; the method returns the count of the number of
# elements for which the block's return value is truthy. In this case, the count
# would be 2, as 2 elements will result in a true boolean value being returned
# from the block. This can be verified in the documentation for Array#count.

# 3. What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# => [1, 2, 3]
# Array#reject returns a collection of the values for which the block evaluates
# to false. Since the last statement in the block is a puts statement, which
# returns nil, the return value of the block is always nil, which is falsey;
# therefore, all the values in the original collection will be added to the new
# collection returned by the method.

# 4. What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# => { 'a'=>'ant', 'b'=>'bear', 'c'=>'cat' }
# The return value is a hash (indicated by the {} argument to the method); the
# block parameters reference each element of the array (value) and the hash
# being returned by the method (hash). The hash []= statement is setting the
# first character of the value as the key, and the value being assigned to that
# key is the element of the array in the current iteration.

# 5. What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# This is documented in Hash#shift, which indicates that the method removes the
# first key/value pair from the collection and returns this pair as a
# two-element array (though the return value is not assigned here). Note: if the
# hash is empty, #shift will return the hash default value, or nil if a default
# is not set.

# 6. What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

# => 11
# The Array#pop method destructively removes the last element in the array and
# returns that value. This results in 'caterpillar'.size; String#size is an
# alias for #length; the result is the length of 'caterpillar'.

# 7. What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# => true
# The return value of the block is a boolean value, which will be true if the
# value of the element is odd. In this case, on the first iteration the block
# will return a value of true. Since this satisfies the assessment of the any?
# method, the other iterations do not need to take place. The block will print
# 1 to the screen for the first iteration.

# 8. How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# => [1, 2]
# Array#take (as we discover with the documentation) returns the first elements
# of the array, the number of which is determined by the method argument, in
# this case 2. Array#take is not destructive, so the original collection remains
# intact.

# 9. What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# => [nil, 'bear']
# Enumerable#map returns an array containing the results of the block for each
# iteration. On the first iteration, the expression for the if statment is
# false, so it is not executed; the value returned by the if statement is nil if
# no condition for the if statement is met. On the second iteration, the if
# condition is met, so the if statement (and thus the block) returns the value.

# 10. What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# => [1, nil, nil]
# map returns an array of values. On the first iteration, the original value is
# returned via the else statement. On hte following iterations, since num > 1,
# the if statement returns nil because the last statement for that condition is
# a puts, which returns nil.
