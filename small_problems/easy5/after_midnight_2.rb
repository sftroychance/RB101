# As seen in the previous exercise, the time of day can be represented as the
# number of minutes before or after midnight. If the number of minutes is
# positive, the time is after midnight. If the number of minutes is negative,
# the time is before midnight.
#
# Write two methods that each take a time of day in 24 hour format, and return
# the number of minutes before and after midnight, respectively. Both methods
# should return a value in the range 0..1439.
#
# You may not use ruby's Date and Time methods.
#
# Examples:
#
# after_midnight('00:00') == 0
# before_midnight('00:00') == 0
# after_midnight('12:34') == 754
# before_midnight('12:34') == 686
# after_midnight('24:00') == 0
# before_midnight('24:00') == 0
#
# Yes, we know that 24:00 isn't a valid time in 24-hour format. Humor us,
# though; it makes the problem more interesting.
#
# Disregard Daylight Savings and Standard Time and other irregularities.
#
=begin
P:
summary: write 2 methods to calculate a 24-hour time to (a) minutes before midnight and (b) minutes after midnight
input: time in 24-hour format 00:00
output: number of minutes before or after midnight (integer)

implicit rules:
explicit rules: don't use Ruby's Date or Time methods

questions:

E:

D:

A:
- write 2 methods that receive string containing time in 24-hour format
- split the string into hours and minutes
- convert hours to minutes and add to minutes value
- for before_midnight, subtract minutes from the number of minutes per day.
- return minutes

=end

SECS_PER_MIN = 60
MINS_PER_HOUR = 60
HOURS_PER_DAY = 24
MINS_PER_DAY = MINS_PER_HOUR * HOURS_PER_DAY

def hour_and_min(time)
  time.split(':').map(&:to_i)
end

def convert_to_minutes(string)
  hours, minutes = hour_and_min(string)
  minutes += (hours % HOURS_PER_DAY) * MINS_PER_HOUR
end

def before_midnight(time)
  minutes = convert_to_minutes(time)
  minutes > 0 ? MINS_PER_DAY - minutes : minutes
end

def after_midnight(time)
  convert_to_minutes(time)
end

def before_midnight_time_class(time)
  baseline = Time.new(2021)

  hour, minute = hour_and_min(time)
  new_time = Time.new(2020, 12, 31, hour, minute, 0)

  ((baseline - new_time) / SECS_PER_MIN) % MINS_PER_DAY
end

def after_midnight_time_class(time)
  baseline = Time.new(2021)

  hour, minute = hour_and_min(time)
  new_time = Time.new(2021, 1, 1, hour, minute, 0)

  ((new_time - baseline) / SECS_PER_MIN) % MINS_PER_DAY
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

p after_midnight_time_class('00:00') == 0
p before_midnight_time_class('00:00') == 0
p after_midnight_time_class('12:34') == 754
p before_midnight_time_class('12:34') == 686
p after_midnight_time_class('24:00') == 0
p before_midnight_time_class('24:00') == 0
