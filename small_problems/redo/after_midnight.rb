MINUTES_PER_DAY = 1440
MINUTES_PER_HOUR = 60

def time_of_day(minute_offset)
  minutes = minute_offset % MINUTES_PER_DAY

  hour = format("%02d", minutes / MINUTES_PER_HOUR)
  minute = format("%02d", minutes % MINUTES_PER_HOUR)

  "#{hour}:#{minute}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
