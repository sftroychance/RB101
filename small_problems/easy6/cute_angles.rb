# Write a method that takes a floating point number that represents an angle
# between 0 and 360 degrees and returns a String that represents that angle in
# degrees, minutes and seconds. You should use a degree symbol (°) to represent
# degrees, a single quote (') to represent minutes, and a double quote (") to
# represent seconds. A degree has 60 minutes, while a minute has 60 seconds.
#
# Examples:
#
# dms(30) == %(30°00'00")
# dms(76.73) == %(76°43'48")
# dms(254.6) == %(254°36'00")
# dms(93.034773) == %(93°02'05")
# dms(0) == %(0°00'00")
# dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
#
# Note: your results may differ slightly depending on how you round values, but
# should be within a second or two of the results shown.
#
# You should use two digit numbers with leading zeros when formatting the
# minutes and seconds, e.g., 321°03'07".
#
=begin
P:
summary: a method that converts a floating point number into degrees/minutes/seconds
input: a floating point number
output: a string formatted %(degrees, minutes, seconds)

implicit rules: 360 degrees can be output at 0 degree
explicit rules: leading zeroes for two-digit numbers for minutes and seconds in output
  1 degree = 60 minutes
  1 minute = 60 seconds
  constant for degree symbol: "\xC2\xB0"

questions:

E:

D:

A:
1. write a method that takes a floating point parameter
2. convert to degrees/minutes/seconds (conversion method)
3. format string (perhaps formatting method)
4. return string.

=end

def convert_dms(degrees)
  dms_hash = { d: 0, m: 0, s: 0 }

  dms_hash[:d] = degrees.to_i % 360
  dms_hash[:m] = (degrees % 1 * 60).to_i
  dms_hash[:s] = (degrees % 1 * 60 % 1 * 60).round

  dms_hash[:m] += dms_hash[:s] / 60
  dms_hash[:s] %= 60

  dms_hash.values
end

def convert_dms_alt(degrees)
  degrees = degrees % 360 * 3600
  min, sec = degrees.divmod(60)
  deg, min = min.divmod(60)
  [deg, min, sec]
end

def format_dms(dms_arr)
  deg, min, sec = dms_arr

  min = format("%02d", min)
  sec = format("%02d", sec)

  "#{deg}\xC2\xB0#{min}\'#{sec}\""
end

def dms(degrees)
  dms_arr = convert_dms_alt(degrees)
  format_dms(dms_arr)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")
