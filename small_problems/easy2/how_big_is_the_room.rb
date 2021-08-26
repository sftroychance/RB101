# Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Example Run:

#   Enter the length of the room in meters:
#   10
#   Enter the width of the room in meters:
#   7
#   The area of the room is 70.0 square meters (753.47 square feet).

SQUARE_FEET_PER_SQUARE_METER = 10.7639

def prompt(message)
  puts "=> #{message}"
end

def area(length, width)
  area_meters = length * width
  area_feet = length * width * SQUARE_FEET_PER_SQUARE_METER

  [area_meters, area_feet]
end

def display_area(area)
  prompt("The area of the room is #{area[0].round(2)} m\u00B2 " \
         "(#{area[1].round(2)} ft\u00B2).")
end

prompt('Enter the length of the room in meters')
length = gets.chomp.to_f

prompt('Enter the width of the room in meters')
width = gets.chomp.to_f

room_area = area(length, width)
display_area(room_area)
