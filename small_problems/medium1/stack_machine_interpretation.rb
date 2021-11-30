=begin
P:
summary: simulate a stack-and-register programming language
input: a string representing a program consisting of integers and commands
output: display the results of PRINT commands given by the program that is input

implicit rules:
explicit rules: all operations are integer operations; all programs are 'correct'; initialize register to 0

questions:

E:


D:
array to stimulate a stack

A:
- tokenize program string input
- loop over tokens
  - if token is an integer, place it in the register
  - if token is a command, call a method to implement the command, as follows:

      PUSH Push the register value on to the stack. Leave the value in the
      register.

      ADD Pops a value from the stack and adds it to the register
      value, storing the result in the register.

      SUB Pops a value from the stack and subtracts it from the register value,
      storing the result in the register.

      MULT Pops a value from the stack and multiplies it by the register value,
      storing the result in the register.

      DIV Pops a value from the stack and divides it into the register value,
      storing the integer result in the register.

      MOD Pops a value from the stack and divides it into the register value,
      storing the integer remainder of the division in the register.

      POP Remove the topmost item from the stack and place in register

      PRINT Print the register value

      use eval to call the method straight from the token:
        - x = "mod(stack, register)"
        - register = eval x
      or a case statement with no method calls

=end

def minilang(program)
  commands = program.split

  stack = []
  register = 0

  commands.each do |command|
    if command == command.to_i.to_s
      register = command.to_i
      next
    end

    case command
    when 'PUSH'   then stack.push(register)
    when 'ADD'    then register += stack.pop
    when 'SUB'    then register -= stack.pop
    when 'MULT'   then register *= stack.pop
    when 'DIV'    then register /= stack.pop
    when 'MOD'    then register %= stack.pop
    when 'POP'    then register = stack.pop
    when 'PRINT'  then puts register
    end
  end

end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)
#
# (3 + (4 * 5) - 7) / (5 % 3)
minilang('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV PRINT')
