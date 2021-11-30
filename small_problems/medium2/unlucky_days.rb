=begin
P:
summary: a method that, given the year, will determine how many days in that
year are Friday the 13th
input: a number representing a year
output: a count of the number of days that year that are Friday the 13th

implicit rules:
explicit rules:

questions:

E:


D:
array to hold intermediate date information

A:
- initialize array to hold dates
- iterate over months 1-12, populate array with dates for the 13th of each month (Time#local)
- select which dates in the array are fridays (Time#friday?)

Further Exploration:
- write a method to count the number of months with five Fridays. Leap year
apparently confuses things, but not sure why with the solution I'm using

- find first friday date in the year
- iterate over remaining weeks (Time.now + (60 * 60 * 24 * 7))
  - add month for the date on this iteration to an intermediate array
- tally intermediate array and count the results that have 5 entries


=end
def friday_13th(year)
  dates = []
  1.upto(12) do |month|
    dates << Time.local(year, month, 13)
  end

  dates.select { |d| d.friday? }.count
end

def five_fridays(year)
  t = Time.new(year)

  until t.friday?
    t += 60 * 60 * 24
  end

  friday_months = []

  until t.year == year + 1
    friday_months << t.month
    t += 60 * 60 * 24 * 7
  end

  friday_months.tally.select { |k, v| v == 5 }.count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

p five_fridays(2015)
p five_fridays(2000)
p five_fridays(2001)
