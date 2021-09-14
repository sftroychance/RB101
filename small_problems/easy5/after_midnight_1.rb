# The time of day can be represented as the number of minutes before or after
# midnight. If the number of minutes is positive, the time is after midnight. If
# the number of minutes is negative, the time is before midnight.
#
# Write a method that takes a time using this minute-based format and returns the
# time of day in 24 hour format (hh:mm). Your method should work with any integer
# input.
#
# You may not use ruby's Date and Time classes.
#
# Examples:
#
# time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"
#
# Disregard Daylight Savings and Standard Time and other complications.
#
=begin
P:
summary: write a method that receives an number representing minutes and calculate the time at the offset of those minutes from midnight.
input: integer minutes (positive or negative)`
output: string representing minutes offset from midnight in 24-hour time format 00:00

implicit rules:
explicit rules: ignore timezones

questions:

E:

D:

A:
- write method receiving minutes parameter
- convert integer to time value in hours and minutes
  - discard portion of time value > 1 day
- add or subtract value from midnight
- convert values to a string format 00:00

=end

def time_of_day(offset)
  neg_flag = offset < 0
  offset = offset.abs

  hours, minutes = offset.divmod(60)
  hours %= 24

  if neg_flag
    hours = 23 - hours if hours
    minutes = 60 - minutes if minutes
  end

  format("%02d:%02d", hours, minutes)
end

def time_of_day_with_time_class(offset)
  time = Time.new(2021)
  time += (offset * 60)
  time.strftime("%H:%M")
end

def time_of_day_from_sunday(offset)
  time = Time.new(2021)
  time -= (time.wday * 60 * 60 * 24)
  time += (offset * 60)
  time.strftime("%A at %H:%M")
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"

p time_of_day_with_time_class(0) == "00:00"
p time_of_day_with_time_class(-3) == "23:57"
p time_of_day_with_time_class(35) == "00:35"
p time_of_day_with_time_class(-1437) == "00:03"
p time_of_day_with_time_class(3000) == "02:00"
p time_of_day_with_time_class(800) == "13:20"

p time_of_day_from_sunday(0)
p time_of_day_from_sunday(-3)
p time_of_day_from_sunday(35)
p time_of_day_from_sunday(-1437)
p time_of_day_from_sunday(3000)
p time_of_day_from_sunday(800)
p time_of_day_from_sunday(-4231)
