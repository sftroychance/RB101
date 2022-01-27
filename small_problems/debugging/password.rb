# The problem with the original code is that is treating
# a local variable as if it were a global variable.
# The simplest solution is to turn password into a global
# variable password, and this fixes the problem.
#
# Rubocop balks at using global variables, however, so the
# best solution is to pass password as a variable to all
# methods that must access. Since assignment
# does not mutate an object (if we were to send the
# password string object to method set_password), we must
# assign password to the return value of the set_password method.
#
# Refactoring note: since we are not doing any validation
# on the user data entry in set_password, we can simply return
# gets.chomp from the method without requiring the intermediate
# variables

password = nil

def set_password
  puts 'What would you like your password to be?'
  # new_password = gets.chomp
  # password = new_password
  gets.chomp
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password)
