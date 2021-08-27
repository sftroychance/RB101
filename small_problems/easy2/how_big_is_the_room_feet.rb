# Modify how_big_is_this_room.rb to ask for the input measurements in feet, and display the results in square feet, square inches, and square centimeters.

SQ_INCHES_PER_SQ_FOOT = 144.0
SQ_CM_PER_SQ_FOOT = 929.03

def prompt(message)
  puts "=> #{message}"
end

def area(length, width)
  area_feet = length * width
  area_inches = length * width * SQ_INCHES_PER_SQ_FOOT
  area_cm = length * width * SQ_CM_PER_SQ_FOOT

  [area_feet, area_inches, area_cm]
end

def display_area(area)
  prompt("The area of the room is #{area[0].round(2)} ft\u00B2 " \
         "(#{area[1].round(2)} in\u00B2, #{area[2].round(2)} cm\u00B2).")
end

prompt('Enter the length of the room in feet')
length = gets.chomp.to_f

prompt('Enter the width of the room in feet')
width = gets.chomp.to_f

room_area = area(length, width)
display_area(room_area)
