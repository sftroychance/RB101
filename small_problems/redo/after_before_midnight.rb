MINUTES_PER_DAY = 1440
MINUTES_PER_HOUR = 60

def after_midnight(time)
  hour, minute = time.split(':')

  (hour.to_i % 24) * MINUTES_PER_HOUR + minute.to_i
end


def before_midnight(time)
  hour, minute = time.split(':')

  (MINUTES_PER_DAY - (hour.to_i * MINUTES_PER_HOUR + minute.to_i)) % MINUTES_PER_DAY
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
